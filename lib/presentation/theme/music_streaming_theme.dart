import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/capture_photo/theme/theme.dart';
import 'package:music_streaming_app/presentation/common/common.dart';
import 'package:music_streaming_app/presentation/onboarding/theme/birthday_or_nickname_step_theme.dart';
import 'package:music_streaming_app/presentation/onboarding/theme/theme.dart';
import 'package:music_streaming_app/presentation/setting/theme/setting_theme.dart';
import 'package:music_streaming_app/presentation/theme/theme.dart';

class MusicStreamingTheme {
  static ThemeData dark() {
    final colorTheme = _darkColorTheme();
    final appTextTheme = MusicStreamingTextTheme(colorTheme: colorTheme);
    final onboardingTheme = OnboardingTheme(
      colorTheme: colorTheme,
      textTheme: appTextTheme,
    );
    final splashScreenTheme = SplashScreenTheme(
      colorTheme: colorTheme,
      textTheme: appTextTheme,
    );
    final primaryButtonTheme = PrimaryButtonTheme(
      colorTheme: colorTheme,
      textTheme: appTextTheme,
    );
    final topBarSectionTheme = TopBarSectionTheme(
      colorTheme: colorTheme,
      textTheme: appTextTheme,
    );
    final dialogHelperTheme = DialogHelperTheme(
      colorTheme: colorTheme,
      textTheme: appTextTheme,
    );
    final inputFieldTheme = InputFieldTheme(
      colorTheme: colorTheme,
      textTheme: appTextTheme,
    );
    final capturePhotoScreenTheme = CapturePhotoScreenTheme(
      colorTheme: colorTheme,
      textTheme: appTextTheme,
    );
    final adBannerTheme = AdBannerTheme(
      colorTheme: colorTheme,
      textTheme: appTextTheme,
    );
    final birthdayStepTheme = BirthdayOrNicknameStepTheme(
      colorTheme: colorTheme,
      textTheme: appTextTheme,
    );
    final settingsScreenTheme = SettingTheme(
      colorTheme: colorTheme,
      textTheme: appTextTheme,
    );
    final nextButtonTheme = NextButtonTheme(
      colorTheme: colorTheme,
      textTheme: appTextTheme,
    );
    final capturePhotoButtonTheme = CapturePhotoButtonTheme(
      colorTheme: colorTheme,
      textTheme: appTextTheme,
    );
    final secondaryButtonTheme = SecondaryButtonTheme(
      colorTheme: colorTheme,
      textTheme: appTextTheme,
    );

    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Lato',
      colorScheme: ColorScheme.fromSeed(
        seedColor: colorTheme.primary,
      ),
      applyElevationOverlayColor: false,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: colorTheme.backgroundPrimary,
      extensions: <ThemeExtension<dynamic>>[
        colorTheme,
        appTextTheme,
        onboardingTheme,
        splashScreenTheme,
        primaryButtonTheme,
        dialogHelperTheme,
        topBarSectionTheme,
        inputFieldTheme,
        settingsScreenTheme,
        capturePhotoScreenTheme,
        adBannerTheme,
        birthdayStepTheme,
        nextButtonTheme,
        secondaryButtonTheme,
        capturePhotoButtonTheme,
      ],
    );
  }

  static MusicStreamingColorTheme _darkColorTheme() {
    return MusicStreamingColorTheme(
      brightness: Brightness.light,
      primary: MusicStreamingColor(
        MusicStreamingColorsPalette.white.value,
      ),
      secondary: MusicStreamingColor(
        MusicStreamingColorsPalette.gray60.value,
      ),
      tertiary: MusicStreamingColor(
        MusicStreamingColorsPalette.black.value,
      ),
      backgroundPrimary: MusicStreamingColor(
        MusicStreamingColorsPalette.black.value,
      ),
    );
  }
}
