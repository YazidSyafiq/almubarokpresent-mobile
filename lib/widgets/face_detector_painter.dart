import 'package:almubarok_present/resources/resources.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:almubarok_present/utils/ml/recognition_embedding.dart';

class FaceDetectorPainter extends CustomPainter {
  FaceDetectorPainter(
    this.absoluteImageSize,
    this.faces,
    this.camDir,
  );

  final Size absoluteImageSize;
  final List<RecognitionEmbedding> faces;
  CameraLensDirection camDir;

  @override
  void paint(Canvas canvas, Size size) {
    final double scaleX = size.width / absoluteImageSize.width;
    final double scaleY = size.height / absoluteImageSize.height;

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = ColorApp.colorPrimary;

    for (RecognitionEmbedding face in faces) {
      canvas.drawRect(
        Rect.fromLTRB(
          camDir == CameraLensDirection.front
              ? (absoluteImageSize.width - face.location.right) * scaleX
              : face.location.left * scaleX,
          face.location.top * scaleY,
          camDir == CameraLensDirection.front
              ? (absoluteImageSize.width - face.location.left) * scaleX
              : face.location.right * scaleX,
          face.location.bottom * scaleY,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(FaceDetectorPainter oldDelegate) {
    return true;
  }
}
