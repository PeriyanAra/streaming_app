import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/theme/theme.dart';

class DialogHelperTheme extends ThemeExtension<DialogHelperTheme> {
  const DialogHelperTheme({
    required MusicStreamingColorTheme colorTheme,
    required MusicStreamingTextTheme textTheme,
  })  : _colorTheme = colorTheme,
        _textTheme = textTheme;

  final MusicStreamingColorTheme _colorTheme;
  final MusicStreamingTextTheme _textTheme;

  EdgeInsets get dialogInsetPadding => const EdgeInsets.all(20.0);

  EdgeInsets get dialogContentPadding => const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      );

  BoxDecoration get dialogContentDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: MusicStreamingColorsPalette.gray80,
      );

  double get dialogContentSpace => 25.0;

  TextStyle get titleTextStyle => _textTheme.displaySmall.copyWith(
        color: _colorTheme.primary,
      );

  @override
  int get hashCode => Object.hash(
        _colorTheme,
        _textTheme,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DialogHelperTheme &&
          runtimeType == other.runtimeType &&
          _colorTheme == other._colorTheme;

  @override
  DialogHelperTheme copyWith({
    MusicStreamingColorTheme? colorTheme,
    MusicStreamingTextTheme? textTheme,
  }) {
    return DialogHelperTheme(
      colorTheme: colorTheme ?? _colorTheme,
      textTheme: textTheme ?? _textTheme,
    );
  }

  @override
  ThemeExtension<DialogHelperTheme> lerp(
    covariant ThemeExtension<DialogHelperTheme>? other,
    double t,
  ) {
    return this;
  }

  static DialogHelperTheme of(BuildContext context) {
    return Theme.of(context).extension<DialogHelperTheme>()!;
  }
}
