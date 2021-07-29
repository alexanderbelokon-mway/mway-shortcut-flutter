import 'package:camera/camera.dart';
import 'package:flutter_image_detection/services/tflite_service.dart';
import 'package:riverpod/riverpod.dart';
import 'detector_state.dart';

final detectorStateNotifierProvider =
    StateNotifierProvider<DetectorStateNotifier, DetectorState>(
        (ref) => DetectorStateNotifier(ref.read(tfliteServiceProvider)));

class DetectorStateNotifier extends StateNotifier<DetectorState> {
  final TfliteService _tfliteService;
  bool _isDetecting = false;
  CameraController? _camera;

  DetectorStateNotifier(this._tfliteService)
      : super(DetectorState(loaded: false));

  initialize() async {
    await _initializeCamera();
    await _initializeTflite();
    state = state.copyWith(loaded: true);
  }

  Future<void> _initializeCamera() async {
    List<CameraDescription> cameras = await availableCameras();
    _camera = CameraController(
      cameras.first,
      ResolutionPreset.low,
    );

    await _camera!.initialize();

    state = state.copyWith(cameraController: _camera);
    _camera!.startImageStream((image) async {
      if (!_isDetecting) {
        _isDetecting = true;
        _tfliteService
            .classifyImage(image)
            .then((value) => _isDetecting = false);
      }
    });
  }

  Future<void> _initializeTflite() async {
    await _tfliteService.loadModel();
    _tfliteService.resultController.stream.listen((results) {
      state = state.copyWith(results: results);
    });
  }

  Future<void> stopCamera() async {
    await _camera!.stopImageStream();
    _camera = null;
  }
}
