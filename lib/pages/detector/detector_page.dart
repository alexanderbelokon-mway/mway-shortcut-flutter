import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_detection/models/detection_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'detector_provider.dart';

class DetectorPage extends ConsumerStatefulWidget {
  @override
  _DetectorPageState createState() => _DetectorPageState();
}

class _DetectorPageState extends ConsumerState<DetectorPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.watch(detectorStateNotifierProvider.notifier).initialize();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(detectorStateNotifierProvider);

    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(title: Text("Cat or Dog")),
          body: (state.loaded && state.cameraController != null)
              ? Column(
                  children: <Widget>[
                    _buildCameraWidget(state.cameraController!),
                    _buildResultWidget(state.results),
                  ],
                )
              : Center(child: CircularProgressIndicator()),
        ),
        onWillPop: () async {
          ref.watch(detectorStateNotifierProvider.notifier).stopCamera();
          return true;
        });
  }

  Widget _buildCameraWidget(CameraController cameraController) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: AspectRatio(
          aspectRatio: 1,
          child: CameraPreview(
            cameraController,
            child: Container(
              margin: const EdgeInsets.all(100.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultWidget(
    List<DetectionResult>? results,
  ) {
    if (results != null && results.isNotEmpty) {
      return ListView.builder(
          itemCount: results.length,
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Text(
                  results[index].label,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.0,
                  ),
                ),
                LinearPercentIndicator(
                  lineHeight: 14.0,
                  percent: results[index].confidence,
                  progressColor: Colors.red,
                ),
                Text(
                  "${(results[index].confidence * 100.0).toStringAsFixed(2)} %",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                  ),
                ),
              ],
            );
          });
    } else {
      return Center(
        child: Text(
          "Wating for model to detect..",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
      );
    }
  }
}
