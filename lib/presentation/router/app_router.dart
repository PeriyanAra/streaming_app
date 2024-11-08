import 'package:auto_route/auto_route.dart';
import 'package:music_streaming_app/presentation/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: UnauthenticatedRoute.page,
          children: [
            AutoRoute(
              initial: true,
              page: AreYouReadyRoute.page,
              path: 'areYouReady',
            ),
            AutoRoute(
              page: OnboardingStepRoute.page,
              path: 'onboardingStep',
            ),
          ],
        ),
        AutoRoute(
          path: '/',
          page: AuthenticatedRoute.page,
          children: [
            AutoRoute(
              initial: true,
              page: CapturePhotoRoute.page,
              path: 'capturePhoto',
            ),
            AutoRoute(
              page: ViewPhotosRoute.page,
              path: 'viewPhotos',
            ),
            AutoRoute(
              page: SettingsRoute.page,
              path: 'settings',
            ),
          ],
        ),
      ];
}
