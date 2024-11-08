import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/theme/theme.dart';

class PrimaryButtonTheme extends ThemeExtension<PrimaryButtonTheme> {
  PrimaryButtonTheme({
    required MusicStreamingColorTheme colorTheme,
    required MusicStreamingTextTheme textTheme,
  })  : _colorTheme = colorTheme,
        _textTheme = textTheme;

  final MusicStreamingColorTheme _colorTheme;
  final MusicStreamingTextTheme _textTheme;

  double get buttonHeight => 50.0;

  BoxDecoration get buttonDecoration => BoxDecoration(
        color: _colorTheme.primary,
        borderRadius: BorderRadius.circular(15.0),
      );

  TextStyle get buttonTextStyle => _textTheme.labelLarge.copyWith(
        fontSize: 17.0,
        color: _colorTheme.tertiary,
      );

  @override
  int get hashCode => Object.hash(
        _colorTheme,
        _textTheme,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrimaryButtonTheme &&
          _colorTheme == other._colorTheme &&
          _textTheme == other._textTheme;

  @override
  ThemeExtension<PrimaryButtonTheme> copyWith({
    MusicStreamingColorTheme? colorTheme,
    MusicStreamingTextTheme? textTheme,
  }) {
    return PrimaryButtonTheme(
      colorTheme: colorTheme ?? _colorTheme,
      textTheme: textTheme ?? _textTheme,
    );
  }

  @override
  ThemeExtension<PrimaryButtonTheme> lerp(
    covariant ThemeExtension<PrimaryButtonTheme>? other,
    double t,
  ) {
    if (other is! PrimaryButtonTheme) {
      return this;
    }

    return PrimaryButtonTheme(
      colorTheme: _colorTheme,
      textTheme: _textTheme,
    );
  }

  static PrimaryButtonTheme of(BuildContext context) {
    return Theme.of(context).extension<PrimaryButtonTheme>()!;
  }
}
