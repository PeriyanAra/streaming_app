import 'dart:async';
import 'dart:developer' as dev;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_streaming_app/app/restart_widget.dart';
import 'package:music_streaming_app/core/di/di_get_it_implementation.dart';
import 'package:music_streaming_app/core/di/register_app_dependencies.dart';

Future<void> mainShared(
  Widget appProvider,
) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();

      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );

      FlutterError.onError = (FlutterErrorDetails errorDetails) {
        Zone.current.handleUncaughtError(
          errorDetails.exception,
          errorDetails.stack ?? StackTrace.empty,
        );
      };

      final di = DiGetItImplementation();
      await registerAppDependencies(di);

      runApp(
        RestartWidget(
          child: EasyLocalization(
            supportedLocales: const [
              Locale('en'),
            ],
            path: 'assets/translations',
            fallbackLocale: const Locale('en'),
            startLocale: const Locale('en'),
            child: appProvider,
          ),
          onBeforeRestart: () async {
            await di.reset();
            await registerAppDependencies(di);
          },
        ),
      );
    },
    (error, StackTrace stackTrace) {
      dev.log(
        'An unhandled error!',
        error: error,
        stackTrace: stackTrace,
      );
    },
  );
}
