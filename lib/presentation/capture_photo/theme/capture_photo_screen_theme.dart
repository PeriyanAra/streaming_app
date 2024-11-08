import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/theme/theme.dart';

class CapturePhotoScreenTheme extends ThemeExtension<CapturePhotoScreenTheme> {
  CapturePhotoScreenTheme({
    required MusicStreamingColorTheme colorTheme,
    required MusicStreamingTextTheme textTheme,
  })  : _colorTheme = colorTheme,
        _textTheme = textTheme;

  final MusicStreamingColorTheme _colorTheme;
  final MusicStreamingTextTheme _textTheme;

  TextStyle get errorTextStyle => _textTheme.titleMedium;

  EdgeInsets get contentSpacing => const EdgeInsets.symmetric(horizontal: 14.0);
  EdgeInsets get contentPadding => const  EdgeInsets.all(25.0);
  EdgeInsets get viewPhotosContentPadding => const  EdgeInsets.all(30.0);


  @override
  int get hashCode => Object.hash(
        _colorTheme,
        _textTheme,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CapturePhotoScreenTheme &&
          _colorTheme == other._colorTheme &&
          _textTheme == other._textTheme;

  @override
  ThemeExtension<CapturePhotoScreenTheme> copyWith({
    MusicStreamingColorTheme? colorTheme,
    MusicStreamingTextTheme? textTheme,
  }) {
    return CapturePhotoScreenTheme(
      colorTheme: colorTheme ?? _colorTheme,
      textTheme: textTheme ?? _textTheme,
    );
  }

  @override
  ThemeExtension<CapturePhotoScreenTheme> lerp(
    covariant ThemeExtension<CapturePhotoScreenTheme>? other,
    double t,
  ) {
    if (other is! CapturePhotoScreenTheme) {
      return this;
    }

    return CapturePhotoScreenTheme(
      colorTheme: _colorTheme,
      textTheme: _textTheme,
    );
  }

  static CapturePhotoScreenTheme of(BuildContext context) {
    return Theme.of(context).extension<CapturePhotoScreenTheme>()!;
  }
}
