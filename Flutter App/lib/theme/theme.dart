import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5f621a),
      surfaceTint: Color(0xff5f621a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffe4e891),
      onPrimaryContainer: Color(0xff474a01),
      secondary: Color(0xff576421),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdbea98),
      onSecondaryContainer: Color(0xff404c09),
      tertiary: Color(0xff6a5f11),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfff4e489),
      onTertiaryContainer: Color(0xff514700),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff9eb),
      onSurface: Color(0xff1d1c13),
      onSurfaceVariant: Color(0xff49473a),
      outline: Color(0xff7a7768),
      outlineVariant: Color(0xffcbc7b5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff333027),
      inversePrimary: Color(0xffc8cc78),
      primaryFixed: Color(0xffe4e891),
      onPrimaryFixed: Color(0xff1c1d00),
      primaryFixedDim: Color(0xffc8cc78),
      onPrimaryFixedVariant: Color(0xff474a01),
      secondaryFixed: Color(0xffdbea98),
      onSecondaryFixed: Color(0xff181e00),
      secondaryFixedDim: Color(0xffbfce7f),
      onSecondaryFixedVariant: Color(0xff404c09),
      tertiaryFixed: Color(0xfff4e489),
      onTertiaryFixed: Color(0xff201c00),
      tertiaryFixedDim: Color(0xffd7c770),
      onTertiaryFixedVariant: Color(0xff514700),
      surfaceDim: Color(0xffdfdacc),
      surfaceBright: Color(0xfffff9eb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f3e5),
      surfaceContainer: Color(0xfff3ede0),
      surfaceContainerHigh: Color(0xffede8da),
      surfaceContainerHighest: Color(0xffe8e2d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff363900),
      surfaceTint: Color(0xff5f621a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6d7128),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff303a00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff66732e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3e3600),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7a6d20),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff9eb),
      onSurface: Color(0xff131109),
      onSurfaceVariant: Color(0xff38362a),
      outline: Color(0xff555345),
      outlineVariant: Color(0xff706d5f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff333027),
      inversePrimary: Color(0xffc8cc78),
      primaryFixed: Color(0xff6d7128),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff555811),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff66732e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4e5a18),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff7a6d20),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff605505),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcbc6b9),
      surfaceBright: Color(0xfffff9eb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f3e5),
      surfaceContainer: Color(0xffede8da),
      surfaceContainerHigh: Color(0xffe2dccf),
      surfaceContainerHighest: Color(0xffd7d1c4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2c2e00),
      surfaceTint: Color(0xff5f621a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff494c04),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff273000),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff424e0c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff332c00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff534900),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff9eb),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2e2c20),
      outlineVariant: Color(0xff4c493c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff333027),
      inversePrimary: Color(0xffc8cc78),
      primaryFixed: Color(0xff494c04),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff333500),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff424e0c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2d3700),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff534900),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3a3300),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbdb8ac),
      surfaceBright: Color(0xfffff9eb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f0e2),
      surfaceContainer: Color(0xffe8e2d4),
      surfaceContainerHigh: Color(0xffd9d4c7),
      surfaceContainerHighest: Color(0xffcbc6b9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc8cc78),
      surfaceTint: Color(0xffc8cc78),
      onPrimary: Color(0xff303300),
      primaryContainer: Color(0xff474a01),
      onPrimaryContainer: Color(0xffe4e891),
      secondary: Color(0xffbfce7f),
      onSecondary: Color(0xff2b3400),
      secondaryContainer: Color(0xff404c09),
      onSecondaryContainer: Color(0xffdbea98),
      tertiary: Color(0xffd7c770),
      onTertiary: Color(0xff383100),
      tertiaryContainer: Color(0xff514700),
      onTertiaryContainer: Color(0xfff4e489),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff15130c),
      onSurface: Color(0xffe8e2d4),
      onSurfaceVariant: Color(0xffcbc7b5),
      outline: Color(0xff949181),
      outlineVariant: Color(0xff49473a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e2d4),
      inversePrimary: Color(0xff5f621a),
      primaryFixed: Color(0xffe4e891),
      onPrimaryFixed: Color(0xff1c1d00),
      primaryFixedDim: Color(0xffc8cc78),
      onPrimaryFixedVariant: Color(0xff474a01),
      secondaryFixed: Color(0xffdbea98),
      onSecondaryFixed: Color(0xff181e00),
      secondaryFixedDim: Color(0xffbfce7f),
      onSecondaryFixedVariant: Color(0xff404c09),
      tertiaryFixed: Color(0xfff4e489),
      onTertiaryFixed: Color(0xff201c00),
      tertiaryFixedDim: Color(0xffd7c770),
      onTertiaryFixedVariant: Color(0xff514700),
      surfaceDim: Color(0xff15130c),
      surfaceBright: Color(0xff3c3930),
      surfaceContainerLowest: Color(0xff100e07),
      surfaceContainerLow: Color(0xff1d1c13),
      surfaceContainer: Color(0xff212017),
      surfaceContainerHigh: Color(0xff2c2a21),
      surfaceContainerHighest: Color(0xff37352b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffdee28c),
      surfaceTint: Color(0xffc8cc78),
      onPrimary: Color(0xff262800),
      primaryContainer: Color(0xff919548),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd5e492),
      onSecondary: Color(0xff212900),
      secondaryContainer: Color(0xff89974e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffeedd83),
      onTertiary: Color(0xff2c2600),
      tertiaryContainer: Color(0xff9f9140),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff15130c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe1dcca),
      outline: Color(0xffb6b2a1),
      outlineVariant: Color(0xff949181),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e2d4),
      inversePrimary: Color(0xff484b02),
      primaryFixed: Color(0xffe4e891),
      onPrimaryFixed: Color(0xff111200),
      primaryFixedDim: Color(0xffc8cc78),
      onPrimaryFixedVariant: Color(0xff363900),
      secondaryFixed: Color(0xffdbea98),
      onSecondaryFixed: Color(0xff0e1300),
      secondaryFixedDim: Color(0xffbfce7f),
      onSecondaryFixedVariant: Color(0xff303a00),
      tertiaryFixed: Color(0xfff4e489),
      onTertiaryFixed: Color(0xff151100),
      tertiaryFixedDim: Color(0xffd7c770),
      onTertiaryFixedVariant: Color(0xff3e3600),
      surfaceDim: Color(0xff15130c),
      surfaceBright: Color(0xff47443b),
      surfaceContainerLowest: Color(0xff090703),
      surfaceContainerLow: Color(0xff1f1e15),
      surfaceContainer: Color(0xff2a281f),
      surfaceContainerHigh: Color(0xff353329),
      surfaceContainerHighest: Color(0xff403e34),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff2f69e),
      surfaceTint: Color(0xffc8cc78),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffc4c875),
      onPrimaryContainer: Color(0xff0b0c00),
      secondary: Color(0xffe8f8a4),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbbca7b),
      onSecondaryContainer: Color(0xff090d00),
      tertiary: Color(0xfffff1aa),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffd3c46d),
      onTertiaryContainer: Color(0xff0e0b00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff15130c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff5f0de),
      outlineVariant: Color(0xffc7c3b1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e2d4),
      inversePrimary: Color(0xff484b02),
      primaryFixed: Color(0xffe4e891),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffc8cc78),
      onPrimaryFixedVariant: Color(0xff111200),
      secondaryFixed: Color(0xffdbea98),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffbfce7f),
      onSecondaryFixedVariant: Color(0xff0e1300),
      tertiaryFixed: Color(0xfff4e489),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd7c770),
      onTertiaryFixedVariant: Color(0xff151100),
      surfaceDim: Color(0xff15130c),
      surfaceBright: Color(0xff535046),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff212017),
      surfaceContainer: Color(0xff333027),
      surfaceContainerHigh: Color(0xff3e3b32),
      surfaceContainerHighest: Color(0xff49473d),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
