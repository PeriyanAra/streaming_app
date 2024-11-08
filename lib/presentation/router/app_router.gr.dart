// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:music_streaming_app/presentation/capture_photo/capture_photo_screen.dart'
    as _i3;
import 'package:music_streaming_app/presentation/onboarding/are_you_ready_screen.dart'
    as _i1;
import 'package:music_streaming_app/presentation/onboarding/onboarding_step_screen.dart'
    as _i4;
import 'package:music_streaming_app/presentation/router/authenticated_screen.dart'
    as _i2;
import 'package:music_streaming_app/presentation/router/unauthenticated_screen.dart'
    as _i6;
import 'package:music_streaming_app/presentation/setting/settings_screen.dart'
    as _i5;
import 'package:music_streaming_app/presentation/view_photos/view_photos_screen.dart'
    as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AreYouReadyRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AreYouReadyScreen(),
      );
    },
    AuthenticatedRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthenticatedScreen(),
      );
    },
    CapturePhotoRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CapturePhotoScreen(),
      );
    },
    OnboardingStepRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.OnboardingStepScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SettingsScreen(),
      );
    },
    UnauthenticatedRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.UnauthenticatedScreen(),
      );
    },
    ViewPhotosRoute.name: (routeData) {
      final args = routeData.argsAs<ViewPhotosRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ViewPhotosScreen(
          key: args.key,
          imagePath: args.imagePath,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AreYouReadyScreen]
class AreYouReadyRoute extends _i8.PageRouteInfo<void> {
  const AreYouReadyRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AreYouReadyRoute.name,
          initialChildren: children,
        );

  static const String name = 'AreYouReadyRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthenticatedScreen]
class AuthenticatedRoute extends _i8.PageRouteInfo<void> {
  const AuthenticatedRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AuthenticatedRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticatedRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CapturePhotoScreen]
class CapturePhotoRoute extends _i8.PageRouteInfo<void> {
  const CapturePhotoRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CapturePhotoRoute.name,
          initialChildren: children,
        );

  static const String name = 'CapturePhotoRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.OnboardingStepScreen]
class OnboardingStepRoute extends _i8.PageRouteInfo<void> {
  const OnboardingStepRoute({List<_i8.PageRouteInfo>? children})
      : super(
          OnboardingStepRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingStepRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SettingsScreen]
class SettingsRoute extends _i8.PageRouteInfo<void> {
  const SettingsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.UnauthenticatedScreen]
class UnauthenticatedRoute extends _i8.PageRouteInfo<void> {
  const UnauthenticatedRoute({List<_i8.PageRouteInfo>? children})
      : super(
          UnauthenticatedRoute.name,
          initialChildren: children,
        );

  static const String name = 'UnauthenticatedRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ViewPhotosScreen]
class ViewPhotosRoute extends _i8.PageRouteInfo<ViewPhotosRouteArgs> {
  ViewPhotosRoute({
    _i9.Key? key,
    required String imagePath,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ViewPhotosRoute.name,
          args: ViewPhotosRouteArgs(
            key: key,
            imagePath: imagePath,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewPhotosRoute';

  static const _i8.PageInfo<ViewPhotosRouteArgs> page =
      _i8.PageInfo<ViewPhotosRouteArgs>(name);
}

class ViewPhotosRouteArgs {
  const ViewPhotosRouteArgs({
    this.key,
    required this.imagePath,
  });

  final _i9.Key? key;

  final String imagePath;

  @override
  String toString() {
    return 'ViewPhotosRouteArgs{key: $key, imagePath: $imagePath}';
  }
}
