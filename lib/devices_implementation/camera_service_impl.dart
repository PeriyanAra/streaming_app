import 'dart:async';

import 'package:camera/camera.dart';
import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/gen/strings.g.dart';

final class CameraServiceImpl with SafeExecutionMixin implements CameraService {
  CameraController? _cameraController;

  @override
  @override
  Future<ResultData<XFile, FailureResult>> captureImage() async {
    return executeSafely(
      () async {
        if (_cameraController == null) {
          return const ResultData.failure(
            FailureResult(
              reason: FailureReasons.unknown,
              debugMessage: '_cameraController is null',
            ),
          );
        }

        final image = await _cameraController!.takePicture();

        return ResultData.success(image);
      },
      onError: ResultData.failure,
    );
  }

  @override
  Future<ResultData<void, FailureResult>> dispose() async {
    return executeSafely<ResultData<void, FailureResult>>(
      () async {
        await _cameraController?.dispose();
        _cameraController = null;

        return const ResultData.success(null);
      },
      onError: ResultData.failure,
    );
  }

  @override
  Future<ResultData<CameraController, FailureResult>> initialize() async {
    return executeSafely<ResultData<CameraController, FailureResult>>(
      () async {
        if (_cameraController != null && _cameraController!.value.isInitialized) {
          return ResultData.success(_cameraController!);
        }

        final cameras = await availableCameras();

        if (cameras.isEmpty) {
          return const ResultData.failure(
            FailureResult(
              reason: FailureReasons.unknown,
              debugMessage: 'Phone not have camera',
              errorMessage: 'Phone not have camera',
            ),
          );
        }
        final frontalCamera = cameras
            .where(
              (camera) => camera.lensDirection == CameraLensDirection.front,
            )
            .toList()
            .firstOrNull;

        final cameraController = CameraController(
          frontalCamera ?? cameras.first,
          ResolutionPreset.high,
          enableAudio: false,
          imageFormatGroup: ImageFormatGroup.jpeg,
        );

        _cameraController = cameraController;

        await _cameraController!.initialize();

        return ResultData.success(_cameraController!);
      },
      onError: ResultData.failure,
    );
  }

  @override
  Future<ResultData<CameraController, FailureResult>> changeCamera() async {
    return executeSafely<ResultData<CameraController, FailureResult>>(
      () async {
        final cameras = await availableCameras();

        if (cameras.isEmpty) {
          return ResultData.failure(
            FailureResult(
              reason: FailureReasons.unknown,
              debugMessage: t.phoneNotHaveCamera,
              errorMessage: t.phoneNotHaveCamera,
            ),
          );
        }
        final lensDirection =
            (_cameraController?.description.lensDirection ?? CameraLensDirection.front) ==
                    CameraLensDirection.front
                ? CameraLensDirection.back
                : CameraLensDirection.front;

        final frontalCamera = cameras
            .where(
              (camera) => camera.lensDirection == lensDirection,
            )
            .toList()
            .firstOrNull;

        if (_cameraController?.value.isInitialized == true) {
          await dispose();
        }

        final cameraController = CameraController(
          frontalCamera ?? cameras.first,
          ResolutionPreset.high,
          enableAudio: false,
          imageFormatGroup: ImageFormatGroup.jpeg,
        );

        _cameraController = cameraController;

        await _cameraController!.initialize();

        return ResultData.success(_cameraController!);
      },
      onError: ResultData.failure,
    );
  }
}
