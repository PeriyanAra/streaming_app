import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/theme/theme.dart';

class SettingTheme extends ThemeExtension<SettingTheme> {
  SettingTheme({
    required MusicStreamingColorTheme colorTheme,
    required MusicStreamingTextTheme textTheme,
  })  : _colorTheme = colorTheme,
        _textTheme = textTheme;

  final MusicStreamingColorTheme _colorTheme;
  final MusicStreamingTextTheme _textTheme;

  TextStyle get settingSectionItemTextStyle => _textTheme.bodyLarge.copyWith(
        color: MusicStreamingColorsPalette.white,
        fontWeight: FontWeight.w600,
      );

  TextStyle get settingSectionTitleTextStyle => _textTheme.titleSmall.copyWith(
        color: MusicStreamingColorsPalette.gray60,
        fontSize: 13.0,
      );

  TextStyle get valueTextStyle => _textTheme.titleSmall.copyWith(
        color: MusicStreamingColorsPalette.gray,
        fontSize: 15.0,
      );

  EdgeInsets get screenPadding => const EdgeInsets.symmetric(horizontal: 25.0);

  double get settingTopSpacing => 30.0;
  double get settingItemSpacing => 24.0;
  double get settingCardBorderRadius => 15.0;
  double get titleBottomSpacing => 7.0;

  Color get backgroundColor => MusicStreamingColorsPalette.black;
  Color get settingCardBackgroundColor => MusicStreamingColorsPalette.black30;
  Color get settingCardDividerColor => MusicStreamingColorsPalette.gray80;

  @override
  int get hashCode => Object.hash(
        _colorTheme,
        _textTheme,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingTheme && _colorTheme == other._colorTheme && _textTheme == other._textTheme;

  @override
  ThemeExtension<SettingTheme> copyWith({
    MusicStreamingColorTheme? colorTheme,
    MusicStreamingTextTheme? textTheme,
  }) {
    return SettingTheme(
      colorTheme: colorTheme ?? _colorTheme,
      textTheme: textTheme ?? _textTheme,
    );
  }

  @override
  ThemeExtension<SettingTheme> lerp(
    covariant ThemeExtension<SettingTheme>? other,
    double t,
  ) {
    if (other is! SettingTheme) {
      return this;
    }

    return SettingTheme(
      colorTheme: _colorTheme,
      textTheme: _textTheme,
    );
  }

  static SettingTheme of(BuildContext context) {
    return Theme.of(context).extension<SettingTheme>()!;
  }
}
