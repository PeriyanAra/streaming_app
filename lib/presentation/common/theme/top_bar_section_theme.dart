import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/theme/theme.dart';

class TopBarSectionTheme extends ThemeExtension<TopBarSectionTheme> {
  TopBarSectionTheme({
    required MusicStreamingColorTheme colorTheme,
    required MusicStreamingTextTheme textTheme,
  })  : _colorTheme = colorTheme,
        _textTheme = textTheme;

  final MusicStreamingColorTheme _colorTheme;
  final MusicStreamingTextTheme _textTheme;

  TextStyle get stepPercentTextStyle => _textTheme.titleMedium.copyWith(
        color: _colorTheme.secondary,
      );

  Color get indicatorSectionPrimaryColor => _colorTheme.secondary;
  Color get indicatorSectionSecondaryColor => _colorTheme.primary;

  double get iconContainerSize => 44.0;
  double get iconContainerBorderRadius => 22.0;

  @override
  int get hashCode => Object.hash(
        _colorTheme,
        _textTheme,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopBarSectionTheme &&
          _colorTheme == other._colorTheme &&
          _textTheme == other._textTheme;

  @override
  ThemeExtension<TopBarSectionTheme> copyWith({
    MusicStreamingColorTheme? colorTheme,
    MusicStreamingTextTheme? textTheme,
  }) {
    return TopBarSectionTheme(
      colorTheme: colorTheme ?? _colorTheme,
      textTheme: textTheme ?? _textTheme,
    );
  }

  @override
  ThemeExtension<TopBarSectionTheme> lerp(
    covariant ThemeExtension<TopBarSectionTheme>? other,
    double t,
  ) {
    if (other is! TopBarSectionTheme) {
      return this;
    }

    return TopBarSectionTheme(
      colorTheme: _colorTheme,
      textTheme: _textTheme,
    );
  }

  static TopBarSectionTheme of(BuildContext context) {
    return Theme.of(context).extension<TopBarSectionTheme>()!;
  }
}
