import 'package:camera/camera.dart';
import 'package:flutter_image_detection/models/detection_result.dart';

class DetectorState {
  final bool loaded;
  final CameraController? cameraController;
  final List<DetectionResult>? results;

  DetectorState({
    required this.loaded,
    this.cameraController,
    this.results,
  });

  DetectorState copyWith({
    bool? loaded,
    CameraController? cameraController,
    List<DetectionResult>? results,
  }) {
    return DetectorState(
      loaded: loaded ?? this.loaded,
      cameraController: cameraController ?? this.cameraController,
      results: results ?? this.results,
    );
  }
}
