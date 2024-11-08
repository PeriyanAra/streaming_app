part of 'capture_photo_bloc.dart';

@freezed
class CapturePhotoEvent with _$CapturePhotoEvent {
  const factory CapturePhotoEvent.initialize() = _CapturePhotoInitializeEvent;

  const factory CapturePhotoEvent.dispose() = _CapturePhotoDisposeEvent;

  const factory CapturePhotoEvent.captureImage({
    required ValueChanged<String> onSuccess,
  }) = _CapturePhotoCaptureImageEvent;

  const factory CapturePhotoEvent.changeCamera(
  ) = _CapturePhotoChangeCameraEvent;
}
