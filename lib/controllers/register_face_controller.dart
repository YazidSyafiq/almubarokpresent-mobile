import 'package:almubarok_present/controllers/attendance_controller.dart';
import 'package:almubarok_present/pages/attendance/register_face/widgets/register_face_dialog.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/routes/page_names.dart';
import 'package:almubarok_present/services/api/attendance_service.dart';
import 'package:almubarok_present/widgets/snackbar_widget.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:almubarok_present/utils/ml/recognition_embedding.dart';
import 'package:almubarok_present/utils/ml/recognizer.dart';
import 'package:image/image.dart' as img;
import 'package:almubarok_present/widgets/face_detector_painter.dart';

class RegisterFaceController extends GetxController {
  List<CameraDescription>? availableCamera;
  late CameraDescription description = availableCamera![1];
  CameraController? cameraController;
  RxBool isCameraReady = false.obs;

  CameraLensDirection camDirec = CameraLensDirection.front;

  RxList<RecognitionEmbedding> recognitions = <RecognitionEmbedding>[].obs;
  late FaceDetector detector;
  late Recognizer recognizer;

  RxBool registerPermission = false.obs;
  RxBool register = false.obs;
  RxBool isBusy = false.obs;

  AttendanceController attendanceController = Get.find();

  @override
  void onInit() {
    initializeCamera();
    detector = FaceDetector(
      options: FaceDetectorOptions(
        performanceMode: FaceDetectorMode.accurate,
      ),
    );
    recognizer = Recognizer();
    super.onInit();
  }

  @override
  void onClose() {
    cameraController!.dispose();
    detector.close();
    super.onClose();
  }

  void initializeCamera() async {
    availableCamera = await availableCameras();
    cameraController = CameraController(
      description,
      ResolutionPreset.max,
      enableAudio: false,
    );

    await cameraController!.initialize().then(
      (_) {
        cameraController!.startImageStream(
          (CameraImage image) {
            if (!isBusy.value) {
              isBusy.value = true;
              frame = image;
              doFaceDetectionOnFrame();
            }
          },
        );
        update();
      },
    );
    isCameraReady.value = true;
  }

  void reverseCamera() async {
    if (availableCamera!.length < 2) {
      return;
    }

    if (description == availableCamera![1]) {
      camDirec = CameraLensDirection.back;
      description = availableCamera![0];
    } else {
      camDirec = CameraLensDirection.front;
      description = availableCamera![1];
    }

    cameraController = CameraController(
      description,
      ResolutionPreset.max,
      enableAudio: false,
    );

    await cameraController!.initialize().then(
      (_) {
        cameraController!.startImageStream(
          (CameraImage image) {
            if (!isBusy.value) {
              isBusy.value = true;
              frame = image;
              doFaceDetectionOnFrame();
            }
          },
        );
        update();
      },
    );
    isCameraReady.value = true;
    update();
  }

  void takePicture() async {
    await cameraController!.takePicture();
    register.value = true;
  }

  dynamic scanResult;
  CameraImage? frame;

  InputImage getInputImage() {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in frame!.planes) {
      allBytes.putUint8List(plane.bytes);
    }

    final bytes = allBytes.done().buffer.asUint8List();
    final Size imageSize = Size(
      frame!.width.toDouble(),
      frame!.height.toDouble(),
    );

    final camera = description;
    final imageRotation = InputImageRotationValue.fromRawValue(
      camera.sensorOrientation,
    );

    final inputImageFormat = InputImageFormatValue.fromRawValue(
      frame!.format.raw,
    );

    final int bytesPerRow =
        frame?.planes.isNotEmpty == true ? frame!.planes.first.bytesPerRow : 0;

    final inputImageMetaData = InputImageMetadata(
      size: imageSize,
      rotation: imageRotation!,
      format: inputImageFormat!,
      bytesPerRow: bytesPerRow,
    );

    final inputImage = InputImage.fromBytes(
      bytes: bytes,
      metadata: inputImageMetaData,
    );
    return inputImage;
  }

  img.Image convertYUV420ToImage(CameraImage cameraImage) {
    final width = cameraImage.width;
    final height = cameraImage.height;

    final yRowStride = cameraImage.planes[0].bytesPerRow;
    final uvRowStride = cameraImage.planes[1].bytesPerRow;
    final uvPixelStride = cameraImage.planes[1].bytesPerPixel!;

    final image = img.Image(width: width, height: height);

    for (var w = 0; w < width; w++) {
      for (var h = 0; h < height; h++) {
        final uvIndex =
            uvPixelStride * (w / 2).floor() + uvRowStride * (h / 2).floor();
        final yIndex = h * yRowStride + w;

        final y = cameraImage.planes[0].bytes[yIndex];
        final u = cameraImage.planes[1].bytes[uvIndex];
        final v = cameraImage.planes[2].bytes[uvIndex];

        final rgbValue = yuv2rgb(y, u, v);
        image.setPixel(
            w,
            h,
            img.ColorRgb8(
              (rgbValue >> 16) & 0xFF, // R
              (rgbValue >> 8) & 0xFF, // G
              rgbValue & 0xFF, // B
            ));
      }
    }
    return image;
  }

  int yuv2rgb(int y, int u, int v) {
    // Convert yuv pixel to rgb
    var r = (y + v * 1436 / 1024 - 179).round();
    var g = (y - u * 46549 / 131072 + 44 - v * 93604 / 131072 + 91).round();
    var b = (y + u * 1814 / 1024 - 227).round();

    // Clipping RGB values to be inside boundaries [0, 255]
    r = r.clamp(0, 255);
    g = g.clamp(0, 255);
    b = b.clamp(0, 255);

    return 0xff000000 |
        ((r << 16) & 0xff0000) |
        ((g << 8) & 0xff00) |
        (b & 0xff);
  }

  doFaceDetectionOnFrame() async {
    try {
      InputImage inputImage = getInputImage();
      List<Face> faces = await detector.processImage(inputImage);
      performFaceRecognition(faces);
    } catch (e) {
      debugPrint('Face detection error: $e');
      isBusy.value = false;
    }
  }

  img.Image? image;

  performFaceRecognition(List<Face> faces) async {
    try {
      recognitions.clear();

      // convert CameraImage to Image and rotate it so that our frame will be in a portrait
      image = convertYUV420ToImage(frame!);
      image = img.copyRotate(image!,
          angle: camDirec == CameraLensDirection.front ? 270 : 90);

      if (faces.isEmpty) {
        registerPermission.value = false;
        isBusy.value = false;
        update();
        return;
      } else {
        registerPermission.value = true;
        for (Face face in faces) {
          Rect faceRect = face.boundingBox;

          // Ensure crop coordinates are within image bounds
          int cropX = faceRect.left.toInt().clamp(0, image!.width - 1);
          int cropY = faceRect.top.toInt().clamp(0, image!.height - 1);
          int cropWidth = faceRect.width.toInt().clamp(1, image!.width - cropX);
          int cropHeight =
              faceRect.height.toInt().clamp(1, image!.height - cropY);

          // crop face
          img.Image croppedFace = img.copyCrop(
            image!,
            x: cropX,
            y: cropY,
            width: cropWidth,
            height: cropHeight,
          );

          // pass cropped face to face recognition model
          RecognitionEmbedding recognition = recognizer.recognize(
            croppedFace,
            face.boundingBox,
          );
          recognitions.add(recognition);

          if (register.value) {
            showFaceRegistrationDialog(
              croppedFace,
              recognition,
            );
            register.value = false;
          }
        }

        isBusy.value = false;
        scanResult = recognitions;
        update();
      }
    } catch (e) {
      debugPrint('Face recognition error: $e');
      isBusy.value = false;
      update();
    }
  }

  Widget buildResult() {
    if (scanResult != null &&
        cameraController != null &&
        cameraController!.value.isInitialized) {
      final Size imageSize = Size(
        cameraController!.value.previewSize!.height,
        cameraController!.value.previewSize!.width,
      );

      CustomPainter painter = FaceDetectorPainter(
        imageSize,
        scanResult,
        camDirec,
      );

      return CustomPaint(
        painter: painter,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  void showFaceRegistrationDialog(
      img.Image croppedFace, RecognitionEmbedding recognition) {
    showDialog(
      context: Get.context!,
      builder: (_) {
        return RegisterFaceDialog(
          onTap: () {
            registerFace(recognition);
          },
        );
      },
    );
  }

  Future<void> registerFace(RecognitionEmbedding recognition) async {
    try {
      FormData formData = FormData.fromMap(
        {
          'face_embedding': recognition.embedding.join(','),
        },
      );

      final response = await AttendanceService.registerFace(formData: formData);
      if (response.data['success'] == true) {
        SnackbarWidget.defaultSnackbar(
          icon: Icon(
            Icons.check_circle,
            color: ColorApp.green,
          ),
          title: 'Berhasil!',
          subtitle: 'Wajah Anda berhasil didaftarkan!',
        );
      }
      attendanceController.getSetupAttendance();
      Get.offAllNamed(PageName.attendance);
    } catch (e) {
      SnackbarWidget.defaultSnackbar(
        icon: Icon(
          Icons.cancel,
          color: ColorApp.red,
        ),
        title: 'Gagal!',
        subtitle: e.toString(),
      );
    }
  }
}
