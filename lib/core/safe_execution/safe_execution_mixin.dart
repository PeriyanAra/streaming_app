import 'dart:async';

import 'package:camera/camera.dart';
import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/gen/strings.g.dart';
import 'package:sentry/sentry.dart';

base mixin SafeExecutionMixin {
  Future<R> executeSafely<R>(
    FutureOr<R> Function() executeCallback, {
    required FutureOr<R> Function(FailureResult error) onError,
  }) async {
    try {
      return await executeCallback();
    } on FailureResult catch (error) {
      unawaited(Sentry.captureException(error));

      return onError(error);
    } on CameraException catch (error, stackTrace) {
      unawaited(Sentry.captureException(error, stackTrace: stackTrace));

      final errorMessage = switch (error.code) {
        'CameraAccessDenied' || 'CameraAccessDeniedWithoutPrompt' => t.cameraAccessDenied,
        'CameraAccessRestricted' => t.cameraAccessRestricted,
        _ => error.description,
      };

      final failureResult = FailureResult(
        reason: FailureReasons.unknown,
        debugMessage: '$error\n$stackTrace',
        errorMessage: errorMessage,
      );

      return onError(failureResult);
    } on Exception catch (error, stackTrace) {
      unawaited(Sentry.captureException(error, stackTrace: stackTrace));

      final failureResult = FailureResult(
        reason: FailureReasons.unknown,
        debugMessage: '$error\n$stackTrace',
        errorMessage: error.toString(),
      );

      return onError(failureResult);
    } on Object catch (error, stackTrace) {
      unawaited(Sentry.captureException(error, stackTrace: stackTrace));

      final failureResult = FailureResult(
        reason: FailureReasons.unknown,
        debugMessage: '$error\n$stackTrace',
        errorMessage: error.toString(),
      );

      return onError(failureResult);
    }
  }
}
