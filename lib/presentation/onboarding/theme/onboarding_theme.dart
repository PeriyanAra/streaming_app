import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/theme/theme.dart';

class OnboardingTheme extends ThemeExtension<OnboardingTheme> {
  OnboardingTheme({
    required MusicStreamingColorTheme colorTheme,
    required MusicStreamingTextTheme textTheme,
  })  : _colorTheme = colorTheme,
        _textTheme = textTheme;

  final MusicStreamingColorTheme _colorTheme;
  final MusicStreamingTextTheme _textTheme;

  TextStyle get titleTextStyle => _textTheme.displayMedium.copyWith(
        color: _colorTheme.primary,
        fontWeight: FontWeight.w800,
      );

  TextStyle get subTitleTextStyle => _textTheme.titleSmall.copyWith(
        color: MusicStreamingColorsPalette.gray,
        fontSize: 15.0,
      );

  EdgeInsets get screenPadding => const EdgeInsets.symmetric(horizontal: 25.0, vertical: 24.0);

  EdgeInsets get guidelineContainerPadding =>
      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 22.0);

  BoxDecoration get guidelineContainerDecoration => BoxDecoration(
        color: _colorTheme.tertiary.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: _colorTheme.secondary,
        ),
      );

  double get subTitleTopSpacing => 14.0;
  double get subTitleBottomSpacing => 40.0;
  double get titleTopSpacing => 49.0;
  double get titleBottomSpacing => 58.0;
  double get nextButtonPositionFromBottom => 25.0;
  double get nextButtonPositionFromRight => 0.0;
  double get secondaryButtonsSpace => 25.0;
  double get firstPhotoButtonBottomSpacing => 50.0;
  double get guidelineTextSpace => 10.0;
  double get guidelineContainerCheckSpace => 8.0;

  TextStyle get imageGuidelineTitleTextStyle => _textTheme.headlineMedium.copyWith(
        color: _colorTheme.primary,
        fontWeight: FontWeight.w800,
      );

  TextStyle get imageGuidelineTextTextStyle => _textTheme.titleLarge.copyWith(
        color: MusicStreamingColorsPalette.gray,
        fontWeight: FontWeight.w500,
      );

  double get imageGuidelinesCheckHeight => 10.0;
  double get imageGuidelinesCheckWidth => 13.0;

  Color get imageGuidelinesCheckColor => MusicStreamingColorsPalette.gray60;

  @override
  int get hashCode => Object.hash(
        _colorTheme,
        _textTheme,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OnboardingTheme &&
          _colorTheme == other._colorTheme &&
          _textTheme == other._textTheme;

  @override
  ThemeExtension<OnboardingTheme> copyWith({
    MusicStreamingColorTheme? colorTheme,
    MusicStreamingTextTheme? textTheme,
  }) {
    return OnboardingTheme(
      colorTheme: colorTheme ?? _colorTheme,
      textTheme: textTheme ?? _textTheme,
    );
  }

  @override
  ThemeExtension<OnboardingTheme> lerp(
    covariant ThemeExtension<OnboardingTheme>? other,
    double t,
  ) {
    if (other is! OnboardingTheme) {
      return this;
    }

    return OnboardingTheme(
      colorTheme: _colorTheme,
      textTheme: _textTheme,
    );
  }

  static OnboardingTheme of(BuildContext context) {
    return Theme.of(context).extension<OnboardingTheme>()!;
  }
}
