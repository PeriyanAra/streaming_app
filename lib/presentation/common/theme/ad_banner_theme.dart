import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/theme/theme.dart';

class AdBannerTheme extends ThemeExtension<AdBannerTheme> {
  AdBannerTheme({
    required MusicStreamingColorTheme colorTheme,
    required MusicStreamingTextTheme textTheme,
  })  : _colorTheme = colorTheme,
        _textTheme = textTheme;

  final MusicStreamingColorTheme _colorTheme;
  final MusicStreamingTextTheme _textTheme;
    
  double get dividerHeight => 2.0;

  Color get progressColor => MusicStreamingColorsPalette.red;

  Color get emptyContentColor => MusicStreamingColorsPalette.black;

  @override
  int get hashCode => Object.hash(
        _colorTheme,
        _textTheme,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdBannerTheme &&
          _colorTheme == other._colorTheme &&
          _textTheme == other._textTheme;

  @override
  ThemeExtension<AdBannerTheme> copyWith({
    MusicStreamingColorTheme? colorTheme,
    MusicStreamingTextTheme? textTheme,
  }) {
    return AdBannerTheme(
      colorTheme: colorTheme ?? _colorTheme,
      textTheme: textTheme ?? _textTheme,
    );
  }

  @override
  ThemeExtension<AdBannerTheme> lerp(
    covariant ThemeExtension<AdBannerTheme>? other,
    double t,
  ) {
    if (other is! AdBannerTheme) {
      return this;
    }

    return AdBannerTheme(
      colorTheme: _colorTheme,
      textTheme: _textTheme,
    );
  }

  static AdBannerTheme of(BuildContext context) {
    return Theme.of(context).extension<AdBannerTheme>()!;
  }
}
