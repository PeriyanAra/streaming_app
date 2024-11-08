import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/theme/theme.dart';

class NextButtonTheme extends ThemeExtension<NextButtonTheme> {
  NextButtonTheme({
    required MusicStreamingColorTheme colorTheme,
    required MusicStreamingTextTheme textTheme,
  })  : _colorTheme = colorTheme,
        _textTheme = textTheme;

  final MusicStreamingColorTheme _colorTheme;
  final MusicStreamingTextTheme _textTheme;

  double get buttonSize => 50.0;
  double get buttonBorderRadius => 25.0;
  Color get buttonColor => _colorTheme.primary;

  @override
  int get hashCode => Object.hash(
        _colorTheme,
        _textTheme,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NextButtonTheme &&
          _colorTheme == other._colorTheme &&
          _textTheme == other._textTheme;

  @override
  ThemeExtension<NextButtonTheme> copyWith({
    MusicStreamingColorTheme? colorTheme,
    MusicStreamingTextTheme? textTheme,
  }) {
    return NextButtonTheme(
      colorTheme: colorTheme ?? _colorTheme,
      textTheme: textTheme ?? _textTheme,
    );
  }

  @override
  ThemeExtension<NextButtonTheme> lerp(
    covariant ThemeExtension<NextButtonTheme>? other,
    double t,
  ) {
    if (other is! NextButtonTheme) {
      return this;
    }

    return NextButtonTheme(
      colorTheme: _colorTheme,
      textTheme: _textTheme,
    );
  }

  static NextButtonTheme of(BuildContext context) {
    return Theme.of(context).extension<NextButtonTheme>()!;
  }
}
