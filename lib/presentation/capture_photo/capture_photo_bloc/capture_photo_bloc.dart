import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/data/data.dart';

part 'capture_photo_event.dart';
part 'capture_photo_state.dart';
part 'capture_photo_bloc.freezed.dart';

class CapturePhotoBloc extends Bloc<CapturePhotoEvent, CapturePhotoState> {
  CapturePhotoBloc({
    required UserRepository userRepository,
    required CameraService cameraService,
  })  : _userRepository = userRepository,
        _cameraService = cameraService,
        super(const CapturePhotoState.initial()) {
    on<_CapturePhotoInitializeEvent>(_handleInitialize);
    on<_CapturePhotoCaptureImageEvent>(_handleCaptureImage);
    on<_CapturePhotoDisposeEvent>(_handleDispose);
    on<_CapturePhotoChangeCameraEvent>(_handleChangeCamera);
  }

  final CameraService _cameraService;
  final UserRepository _userRepository;

  Future<void> _handleInitialize(
    _CapturePhotoInitializeEvent event,
    Emitter<CapturePhotoState> emit,
  ) async {
    emit(
      const CapturePhotoState.loading(),
    );

    final response = await _cameraService.initialize();

    response.when(
      success: (cameraController) => emit(
        CapturePhotoState.loaded(
          cameraController: cameraController,
        ),
      ),
      failure: (f) => emit(
        CapturePhotoState.error(
          errorMessage: f.errorMessage ?? 'defaultErrorMessage',
        ),
      ),
    );
  }

  Future<void> _handleCaptureImage(
    _CapturePhotoCaptureImageEvent event,
    Emitter<CapturePhotoState> emit,
  ) async {
    emit(
      CapturePhotoState.loading(
        cameraController: state.cameraController,
      ),
    );

    final response = await _cameraService.captureImage();

    await response.when(
      success: (photo) async {
        final uploadResponse = await _userRepository.uploadPhoto(photo.path);

        uploadResponse.when(
          success: (photoPath) {
            if (state.cameraController != null) {
              emit(
                CapturePhotoState.loaded(
                  cameraController: state.cameraController!,
                ),
              );
            }

            event.onSuccess(photoPath);
          },
          failure: (f) => emit(
            CapturePhotoState.error(
              errorMessage: f.errorMessage ?? 'defaultErrorMessage',
              cameraController: state.cameraController,
            ),
          ),
        );
      },
      failure: (f) {
        emit(
          CapturePhotoState.error(
            errorMessage: f.errorMessage ?? 'defaultErrorMessage',
            cameraController: state.cameraController,
          ),
        );
      },
    );
  }

  Future<void> _handleDispose(
    _CapturePhotoDisposeEvent event,
    Emitter<CapturePhotoState> emit,
  ) async {
    await _cameraService.dispose();

    emit(const CapturePhotoState.initial());
  }

  Future<void> _handleChangeCamera(
    _CapturePhotoChangeCameraEvent event,
    Emitter<CapturePhotoState> emit,
  ) async {
    emit(
      const CapturePhotoState.loading(),
    );

    final response = await _cameraService.changeCamera();

    response.when(
      success: (cameraController) => emit(
        CapturePhotoState.loaded(
          cameraController: cameraController,
        ),
      ),
      failure: (f) => emit(
        CapturePhotoState.error(
          errorMessage: f.errorMessage ?? 'defaultErrorMessage',
        ),
      ),
    );
  }
}
