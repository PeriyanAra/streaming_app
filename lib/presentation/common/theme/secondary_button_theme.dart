import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/theme/theme.dart';

class SecondaryButtonTheme extends ThemeExtension<SecondaryButtonTheme> {
  SecondaryButtonTheme({
    required MusicStreamingColorTheme colorTheme,
    required MusicStreamingTextTheme textTheme,
  })  : _colorTheme = colorTheme,
        _textTheme = textTheme;

  final MusicStreamingColorTheme _colorTheme;
  final MusicStreamingTextTheme _textTheme;

  double get buttonHeight => 67.0;
  double get borderRadius => 15.0;
  Color get buttonColor => _colorTheme.tertiary.withOpacity(0.3);
  Color get borderColor => _colorTheme.secondary;

  TextStyle get contentTextStyle => _textTheme.headlineLarge.copyWith(
        fontWeight: FontWeight.w800,
        fontSize: 23.0,
      );

  @override
  int get hashCode => Object.hash(
        _colorTheme,
        _textTheme,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SecondaryButtonTheme &&
          _colorTheme == other._colorTheme &&
          _textTheme == other._textTheme;

  @override
  ThemeExtension<SecondaryButtonTheme> copyWith({
    MusicStreamingColorTheme? colorTheme,
    MusicStreamingTextTheme? textTheme,
  }) {
    return SecondaryButtonTheme(
      colorTheme: colorTheme ?? _colorTheme,
      textTheme: textTheme ?? _textTheme,
    );
  }

  @override
  ThemeExtension<SecondaryButtonTheme> lerp(
    covariant ThemeExtension<SecondaryButtonTheme>? other,
    double t,
  ) {
    if (other is! SecondaryButtonTheme) {
      return this;
    }

    return SecondaryButtonTheme(
      colorTheme: _colorTheme,
      textTheme: _textTheme,
    );
  }

  static SecondaryButtonTheme of(BuildContext context) {
    return Theme.of(context).extension<SecondaryButtonTheme>()!;
  }
}
