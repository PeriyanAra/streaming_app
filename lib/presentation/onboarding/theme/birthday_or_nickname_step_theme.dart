import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/theme/theme.dart';

class BirthdayOrNicknameStepTheme extends ThemeExtension<BirthdayOrNicknameStepTheme> {
  BirthdayOrNicknameStepTheme({
    required MusicStreamingColorTheme colorTheme,
    required MusicStreamingTextTheme textTheme,
  })  : _colorTheme = colorTheme,
        _textTheme = textTheme;

  final MusicStreamingColorTheme _colorTheme;
  final MusicStreamingTextTheme _textTheme;

  double get dayMonthFieldWidth => 74.0;
  double get yearFieldWidth => 103.0;
  double get fieldSpace => 20.0;
  double get bottomTextTopSpace => 5.0;

  TextStyle get bottomTextStyle => _textTheme.bodyLarge.copyWith(
        color: _colorTheme.secondary,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      );

  @override
  int get hashCode => Object.hash(
        _colorTheme,
        _textTheme,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BirthdayOrNicknameStepTheme &&
          _colorTheme == other._colorTheme &&
          _textTheme == other._textTheme;

  @override
  ThemeExtension<BirthdayOrNicknameStepTheme> copyWith({
    MusicStreamingColorTheme? colorTheme,
    MusicStreamingTextTheme? textTheme,
  }) {
    return BirthdayOrNicknameStepTheme(
      colorTheme: colorTheme ?? _colorTheme,
      textTheme: textTheme ?? _textTheme,
    );
  }

  @override
  ThemeExtension<BirthdayOrNicknameStepTheme> lerp(
    covariant ThemeExtension<BirthdayOrNicknameStepTheme>? other,
    double t,
  ) {
    if (other is! BirthdayOrNicknameStepTheme) {
      return this;
    }

    return BirthdayOrNicknameStepTheme(
      colorTheme: _colorTheme,
      textTheme: _textTheme,
    );
  }

  static BirthdayOrNicknameStepTheme of(BuildContext context) {
    return Theme.of(context).extension<BirthdayOrNicknameStepTheme>()!;
  }
}
