import 'dart:async';

import 'package:camera/camera.dart';
import 'package:music_streaming_app/core/core.dart';

abstract interface class CameraService {
  Future<ResultData<CameraController, FailureResult>> initialize();

  Future<ResultData<void, FailureResult>> dispose();

  Future<ResultData<XFile, FailureResult>> captureImage();

  Future<ResultData<CameraController, FailureResult>> changeCamera();
}
