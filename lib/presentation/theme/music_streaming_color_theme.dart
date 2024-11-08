import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/theme/theme.dart';

const _halfT = 0.5;

@immutable
class MusicStreamingColorTheme extends ThemeExtension<MusicStreamingColorTheme> {
  const MusicStreamingColorTheme({
    required this.brightness,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.backgroundPrimary,
  });

  final Brightness brightness;

  final MusicStreamingColor primary;
  final MusicStreamingColor secondary;
  final MusicStreamingColor tertiary;

  final MusicStreamingColor backgroundPrimary;

  @override
  int get hashCode => Object.hash(
        primary,
        secondary,
        tertiary,
        backgroundPrimary,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicStreamingColorTheme &&
          runtimeType == other.runtimeType &&
          primary == other.primary &&
          secondary == other.secondary &&
          tertiary == other.tertiary &&
          backgroundPrimary == other.backgroundPrimary;

  @override
  MusicStreamingColorTheme copyWith({
    MusicStreamingColor? primary,
    MusicStreamingColor? secondary,
  }) {
    return MusicStreamingColorTheme(
      brightness: brightness,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary,
      backgroundPrimary: backgroundPrimary,
    );
  }

  @override
  ThemeExtension<MusicStreamingColorTheme> lerp(
    covariant ThemeExtension<MusicStreamingColorTheme>? other,
    double t,
  ) {
    if (other is! MusicStreamingColorTheme) {
      return this;
    }

    return MusicStreamingColorTheme(
      brightness: t < _halfT ? brightness : other.brightness,
      primary: primary.lerp(other.primary, t),
      secondary: secondary.lerp(other.secondary, t),
      tertiary: tertiary.lerp(other.tertiary, t),
      backgroundPrimary: backgroundPrimary.lerp(other.backgroundPrimary, t),
    );
  }

  static MusicStreamingColorTheme of(BuildContext context) {
    return Theme.of(context).extension<MusicStreamingColorTheme>()!;
  }
}
