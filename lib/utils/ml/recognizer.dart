import 'dart:math';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:almubarok_present/utils/ml/recognition_embedding.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class Recognizer {
  late Interpreter interpreter;
  late InterpreterOptions interpreterOptions;
  static const int _width = 112;
  static const int _height = 112;

  String get modelName => 'assets/model/mobile_face_net.tflite';

  Future<void> loadModel() async {
    try {
      interpreter = await Interpreter.fromAsset(modelName);
    } catch (e) {
      debugPrint(
          'Unable to create interpreter, Caught Exception: ${e.toString()}');
    }
  }

  Recognizer({int? numThreads}) {
    interpreterOptions = InterpreterOptions();

    if (numThreads != null) {
      interpreterOptions.threads = numThreads;
    }

    loadModel();
  }

  List<dynamic> imageToArray(img.Image inputImage) {
    img.Image resizedImage =
        img.copyResize(inputImage, width: _width, height: _height);
    List<double> flattenedList = resizedImage.data!
        .expand((channel) => [channel.r, channel.g, channel.b])
        .map((value) => value.toDouble())
        .toList();
    Float32List float32Array = Float32List.fromList(flattenedList);
    int channels = 3;
    int height = _height;
    int width = _width;
    Float32List reshapedArray = Float32List(1 * height * width * channels);

    for (int c = 0; c < channels; c++) {
      for (int h = 0; h < height; h++) {
        for (int w = 0; w < width; w++) {
          int index = c * height * width + h * width + w;
          reshapedArray[index] =
              (float32Array[c * height * width + h * width + w] - 127.5) /
                  127.5;
        }
      }
    }
    return reshapedArray.reshape([1, 112, 112, 3]);
  }

  RecognitionEmbedding recognize(img.Image image, Rect location) {
    // crop face from image resize it and convert it to float array
    var input = imageToArray(image);
    debugPrint(input.shape.toString());

    // output array
    List output = List.filled(1 * 192, 0).reshape([1, 192]);

    // performs inference
    // final runs = DateTime.now().millisecondsSinceEpoch;
    interpreter.run(input, output);

    List<double> outputArray = output.first.cast<double>();

    return RecognitionEmbedding(location, outputArray);
  }

  PairEmbedding findNearest(List<double> emb, List<double> authFaceEmbedding) {
    double distance = 0;

    for (int i = 0; i < emb.length; i++) {
      double diff = emb[i] - authFaceEmbedding[i];
      distance += diff * diff;
    }
    distance = sqrt(distance);

    return PairEmbedding(distance);
  }

  Future<bool> isValidFace(List<double> emb, String? faceEmbedding) async {
    if (faceEmbedding == null) return false;

    PairEmbedding pair = findNearest(
      emb,
      faceEmbedding.split(',').map((e) => double.parse(e)).toList(),
    );
    debugPrint('distance = ${pair.distance}');
    if (pair.distance < 0.95) {
      return true;
    } else {
      return false;
    }
  }
}

class PairEmbedding {
  double distance;
  PairEmbedding(this.distance);
}
