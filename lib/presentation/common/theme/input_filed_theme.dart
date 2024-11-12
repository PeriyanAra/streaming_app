import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/theme/theme.dart';

class InputFieldTheme extends ThemeExtension<InputFieldTheme> {
  const InputFieldTheme({
    required MusicStreamingColorTheme colorTheme,
    required MusicStreamingTextTheme textTheme,
  })  : _colorTheme = colorTheme,
        _textTheme = textTheme;

  final MusicStreamingColorTheme _colorTheme;
  final MusicStreamingTextTheme _textTheme;

  OutlineInputBorder get enabledBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: _colorTheme.secondary,
        ),
        borderRadius: BorderRadius.circular(15.0),
      );

  OutlineInputBorder get errorBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: _colorTheme.error,
        ),
        borderRadius: BorderRadius.circular(15.0),
      );

  TextStyle get primaryTextStyle => _textTheme.displaySmall.copyWith(
        color: _colorTheme.primary,
        fontSize: 25.0,
        fontWeight: FontWeight.w800,
      );

  EdgeInsets get contentPadding => const EdgeInsets.fromLTRB(
        22.0,
        15.0,
        18.0,
        18.0,
      );

  double get cursorHeight => 25.0;

  Color get cursorColor => _colorTheme.primary;
  Color get backgroundColor => _colorTheme.tertiary.withOpacity(0.3);

  @override
  int get hashCode => Object.hash(
        _colorTheme,
        _textTheme,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InputFieldTheme &&
          runtimeType == other.runtimeType &&
          _textTheme == other._textTheme &&
          _colorTheme == other._colorTheme;

  @override
  InputFieldTheme copyWith({
    MusicStreamingColorTheme? colorTheme,
    MusicStreamingTextTheme? textTheme,
  }) {
    return InputFieldTheme(
      textTheme: textTheme ?? _textTheme,
      colorTheme: colorTheme ?? _colorTheme,
    );
  }

  @override
  ThemeExtension<InputFieldTheme> lerp(
    covariant ThemeExtension<InputFieldTheme>? other,
    double t,
  ) {
    return this;
  }

  static InputFieldTheme of(BuildContext context) {
    return Theme.of(context).extension<InputFieldTheme>()!;
  }
}
