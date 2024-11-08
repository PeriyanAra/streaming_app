import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/common/common.dart';
import 'package:music_streaming_app/presentation/onboarding/theme/theme.dart';
import 'package:music_streaming_app/presentation/router/app_router.gr.dart';

@RoutePage()
class AreYouReadyScreen extends StatelessWidget {
  const AreYouReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashScreenTheme = SplashScreenTheme.of(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              Assets.splashImage,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: splashScreenTheme.bottomContainerHeight,
            width: double.infinity,
            padding: splashScreenTheme.bottomContainerPadding,
            decoration: splashScreenTheme.bottomContainerDecoration,
            child: Column(
              children: [
                Text(
                  'splashTitle'.tr(),
                  textAlign: TextAlign.center,
                  style: splashScreenTheme.titleTextStyle,
                ),
                HBox(height: splashScreenTheme.subtitleTopSpace),
                Text(
                  'splashSubtitle'.tr(),
                  textAlign: TextAlign.center,
                  style: splashScreenTheme.subtitleTextStyle,
                ),
                HBox(height: splashScreenTheme.subtitleBottomSpace),
                Padding(
                  padding: splashScreenTheme.continueButtonPadding,
                  child: PrimaryButton(
                    onTap: () => context.router.push(const OnboardingStepRoute()),
                    text: 'continueText'.tr(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
