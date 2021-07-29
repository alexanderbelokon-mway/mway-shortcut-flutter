import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter_image_detection/models/detection_result.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tflite/tflite.dart';

final tfliteServiceProvider = Provider<TfliteService>((ref) {
  return TfliteService();
});

class TfliteService {
  final _modelPath = "assets/model_unquant.tflite";
  final _labelPath = "assets/labels.txt";

  List<DetectionResult> _results = [];
  StreamController<List<DetectionResult>> resultController =
      StreamController.broadcast();

  Future<String?> loadModel() {
    return Tflite.loadModel(
      model: _modelPath,
      labels: _labelPath,
    );
  }

  Future<void> classifyImage(CameraImage image) async {
    List<dynamic>? resultList = await Tflite.runModelOnFrame(
      bytesList: image.planes.map((plane) => plane.bytes).toList(),
      imageWidth: image.width,
      imageHeight: image.height,
    );

    if (resultList != null && resultList.isNotEmpty) {
      _results.clear();
      _results = resultList
          .map((dynamic element) => DetectionResult(
                element['index'],
                element['label'],
                element['confidence'],
              ))
          .toList();
      _results.sort((a, b) => a.confidence.compareTo(b.confidence));
      resultController.add(_results);
    }
  }

  void disposeModel() {
    Tflite.close();
    resultController.close();
  }
}
