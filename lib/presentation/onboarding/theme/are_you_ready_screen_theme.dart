import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/theme/theme.dart';

class SplashScreenTheme extends ThemeExtension<SplashScreenTheme> {
  SplashScreenTheme({
    required MusicStreamingColorTheme colorTheme,
    required MusicStreamingTextTheme textTheme,
  })  : _colorTheme = colorTheme,
        _textTheme = textTheme;

  final MusicStreamingColorTheme _colorTheme;
  final MusicStreamingTextTheme _textTheme;

  TextStyle get titleTextStyle => _textTheme.headlineLarge.copyWith(
        fontSize: 25.0,
        fontWeight: FontWeight.w800,
        color: _colorTheme.primary,
      );

  TextStyle get subtitleTextStyle => _textTheme.titleLarge.copyWith(
        fontWeight: FontWeight.w400,
        color: _colorTheme.secondary,
      );

  BoxDecoration get bottomContainerDecoration => BoxDecoration(
        color: _colorTheme.tertiary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      );

  EdgeInsets get bottomContainerPadding => const EdgeInsets.only(top: 30.0);
  EdgeInsets get continueButtonPadding =>
      const EdgeInsets.symmetric(horizontal: 25.0);

  double get subtitleTopSpace => 11.0;
  double get subtitleBottomSpace => 15.0;
  double get bottomContainerHeight => 291.0;

  @override
  int get hashCode => Object.hash(
        _colorTheme,
        _textTheme,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SplashScreenTheme &&
          _colorTheme == other._colorTheme &&
          _textTheme == other._textTheme;

  @override
  ThemeExtension<SplashScreenTheme> copyWith({
    MusicStreamingColorTheme? colorTheme,
    MusicStreamingTextTheme? textTheme,
  }) {
    return SplashScreenTheme(
      colorTheme: colorTheme ?? _colorTheme,
      textTheme: textTheme ?? _textTheme,
    );
  }

  @override
  ThemeExtension<SplashScreenTheme> lerp(
    covariant ThemeExtension<SplashScreenTheme>? other,
    double t,
  ) {
    if (other is! SplashScreenTheme) {
      return this;
    }

    return SplashScreenTheme(
      colorTheme: _colorTheme,
      textTheme: _textTheme,
    );
  }

  static SplashScreenTheme of(BuildContext context) {
    return Theme.of(context).extension<SplashScreenTheme>()!;
  }
}
