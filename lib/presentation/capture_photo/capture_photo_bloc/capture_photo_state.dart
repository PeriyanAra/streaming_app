part of 'capture_photo_bloc.dart';

@freezed
class CapturePhotoState with _$CapturePhotoState {
  const CapturePhotoState._();

  const factory CapturePhotoState.initial() = CapturePhotoInitialState;

  const factory CapturePhotoState.loading({
    CameraController? cameraController,
  }) = CapturePhotoLoadingState;

  const factory CapturePhotoState.loaded({
    required CameraController cameraController,
  }) = CapturePhotoLoadedState;

  const factory CapturePhotoState.error({
    required String errorMessage,
    CameraController? cameraController,
  }) = CapturePhotoErrorState;

  CameraController? get cameraController => switch (this) {
        CapturePhotoLoadingState(:final cameraController) => cameraController,
        CapturePhotoLoadedState(:final cameraController) => cameraController,
        CapturePhotoErrorState(:final cameraController) => cameraController,
        _ => null,
      };
}
