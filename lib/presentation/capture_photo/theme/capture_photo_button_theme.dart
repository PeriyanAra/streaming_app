import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/theme/theme.dart';

class CapturePhotoButtonTheme extends ThemeExtension<CapturePhotoButtonTheme> {
  CapturePhotoButtonTheme({
    required MusicStreamingColorTheme colorTheme,
    required MusicStreamingTextTheme textTheme,
  })  : _colorTheme = colorTheme,
        _textTheme = textTheme;

  final MusicStreamingColorTheme _colorTheme;
  final MusicStreamingTextTheme _textTheme;

  double get height => 84.0;

  Color get color => MusicStreamingColorsPalette.white;

  Color get shadowColor => MusicStreamingColorsPalette.black.withOpacity(0.2);

  BorderRadius get insideButtonBorderRadius => BorderRadius.circular((height - 20) / 2);

  double get insideButtonSize => 64.0;

  BorderRadius get buttonBorderBorderRadius => BorderRadius.circular(height / 2);

  double get opacity => 0.5;
  double get spreadRadius => 5.0;
  double get blurRadius => 7.0;
  Offset get offset => const Offset(0, 3);

  @override
  int get hashCode => Object.hash(
        _colorTheme,
        _textTheme,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CapturePhotoButtonTheme &&
          _colorTheme == other._colorTheme &&
          _textTheme == other._textTheme;

  @override
  ThemeExtension<CapturePhotoButtonTheme> copyWith({
    MusicStreamingColorTheme? colorTheme,
    MusicStreamingTextTheme? textTheme,
  }) {
    return CapturePhotoButtonTheme(
      colorTheme: colorTheme ?? _colorTheme,
      textTheme: textTheme ?? _textTheme,
    );
  }

  @override
  ThemeExtension<CapturePhotoButtonTheme> lerp(
    covariant ThemeExtension<CapturePhotoButtonTheme>? other,
    double t,
  ) {
    if (other is! CapturePhotoButtonTheme) {
      return this;
    }

    return CapturePhotoButtonTheme(
      colorTheme: _colorTheme,
      textTheme: _textTheme,
    );
  }

  static CapturePhotoButtonTheme of(BuildContext context) {
    return Theme.of(context).extension<CapturePhotoButtonTheme>()!;
  }
}
