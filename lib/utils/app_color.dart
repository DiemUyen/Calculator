import 'package:flutter/material.dart';

class AppColor extends ThemeExtension<AppColor> {
  static const mainColor1 =
      MaterialColor(0xFFEE7A06, AppColorSwatch.mainColor1Swatch);
  static const mainColor2 =
      MaterialColor(0xFF9968ED, AppColorSwatch.mainColor2Swatch);
  static const mainColor1Surface =
      MaterialColor(0xFFEE973C, AppColorSwatch.mainColor1SurfaceSwatch);
  static const mainColor2Surface =
      MaterialColor(0xFF7A2DF5, AppColorSwatch.mainColor2SurfaceSwatch);
  static const mainColor1Container =
      MaterialColor(0xFFF5C185, AppColorSwatch.mainColor1ContainerSwatch);
  static const mainColor2Container =
      MaterialColor(0xFFC38BE6, AppColorSwatch.mainColor2ContainerSwatch);
  static const secondaryColorSurface =
      MaterialColor(0xFFF5C6DC, AppColorSwatch.secondaryColorSurfaceSwatch);
  static const secondaryColorContainer =
      MaterialColor(0xFFFBF4F5, AppColorSwatch.secondaryColorContainerSwatch);

  @override
  ThemeExtension<AppColor> copyWith() => AppColor();

  @override
  ThemeExtension<AppColor> lerp(
      covariant ThemeExtension<AppColor>? other, double t) {
    if (other is! AppColor) return this;
    return AppColor();
  }
}

class AppColorSwatch {
  static const Map<int, Color> mainColor1Swatch = {
    50: Color.fromRGBO(238, 122, 6, .1),
    100: Color.fromRGBO(238, 122, 6, .2),
    200: Color.fromRGBO(238, 122, 6, .3),
    300: Color.fromRGBO(238, 122, 6, .4),
    400: Color.fromRGBO(238, 122, 6, .5),
    500: Color.fromRGBO(238, 122, 6, .6),
    600: Color.fromRGBO(238, 122, 6, .7),
    700: Color.fromRGBO(238, 122, 6, .8),
    800: Color.fromRGBO(238, 122, 6, .9),
    900: Color.fromRGBO(238, 122, 6, 1),
  };

  static const Map<int, Color> mainColor2Swatch = {
    50: Color.fromRGBO(153, 104, 237, .1),
    100: Color.fromRGBO(153, 104, 237, .2),
    200: Color.fromRGBO(153, 104, 237, .3),
    300: Color.fromRGBO(153, 104, 237, .4),
    400: Color.fromRGBO(153, 104, 237, .5),
    500: Color.fromRGBO(153, 104, 237, .6),
    600: Color.fromRGBO(153, 104, 237, .7),
    700: Color.fromRGBO(153, 104, 237, .8),
    800: Color.fromRGBO(153, 104, 237, .9),
    900: Color.fromRGBO(153, 104, 237, 1),
  };

  static const Map<int, Color> mainColor1SurfaceSwatch = {
    50: Color.fromRGBO(238, 151, 60, .1),
    100: Color.fromRGBO(238, 151, 60, .2),
    200: Color.fromRGBO(238, 151, 60, .3),
    300: Color.fromRGBO(238, 151, 60, .4),
    400: Color.fromRGBO(238, 151, 60, .5),
    500: Color.fromRGBO(238, 151, 60, .6),
    600: Color.fromRGBO(238, 151, 60, .7),
    700: Color.fromRGBO(238, 151, 60, .8),
    800: Color.fromRGBO(238, 151, 60, .9),
    900: Color.fromRGBO(238, 151, 60, 1),
  };

  static const Map<int, Color> mainColor2SurfaceSwatch = {
    50: Color.fromRGBO(122, 45, 245, .1),
    100: Color.fromRGBO(122, 45, 245, .2),
    200: Color.fromRGBO(122, 45, 245, .3),
    300: Color.fromRGBO(122, 45, 245, .4),
    400: Color.fromRGBO(122, 45, 245, .5),
    500: Color.fromRGBO(122, 45, 245, .6),
    600: Color.fromRGBO(122, 45, 245, .7),
    700: Color.fromRGBO(122, 45, 245, .8),
    800: Color.fromRGBO(122, 45, 245, .9),
    900: Color.fromRGBO(122, 45, 245, 1),
  };

  static const Map<int, Color> mainColor1ContainerSwatch = {
    50: Color.fromRGBO(245, 193, 133, .1),
    100: Color.fromRGBO(245, 193, 133, .2),
    200: Color.fromRGBO(245, 193, 133, .3),
    300: Color.fromRGBO(245, 193, 133, .4),
    400: Color.fromRGBO(245, 193, 133, .5),
    500: Color.fromRGBO(245, 193, 133, .6),
    600: Color.fromRGBO(245, 193, 133, .7),
    700: Color.fromRGBO(245, 193, 133, .8),
    800: Color.fromRGBO(245, 193, 133, .9),
    900: Color.fromRGBO(245, 193, 133, 1),
  };

  static const Map<int, Color> mainColor2ContainerSwatch = {
    50: Color.fromRGBO(195, 139, 230, .1),
    100: Color.fromRGBO(195, 139, 230, .2),
    200: Color.fromRGBO(195, 139, 230, .3),
    300: Color.fromRGBO(195, 139, 230, .4),
    400: Color.fromRGBO(195, 139, 230, .5),
    500: Color.fromRGBO(195, 139, 230, .6),
    600: Color.fromRGBO(195, 139, 230, .7),
    700: Color.fromRGBO(195, 139, 230, .8),
    800: Color.fromRGBO(195, 139, 230, .9),
    900: Color.fromRGBO(195, 139, 230, 1),
  };

  static const Map<int, Color> secondaryColorSurfaceSwatch = {
    50: Color.fromRGBO(245, 198, 220, .1),
    100: Color.fromRGBO(245, 198, 220, .2),
    200: Color.fromRGBO(245, 198, 220, .3),
    300: Color.fromRGBO(245, 198, 220, .4),
    400: Color.fromRGBO(245, 198, 220, .5),
    500: Color.fromRGBO(245, 198, 220, .6),
    600: Color.fromRGBO(245, 198, 220, .7),
    700: Color.fromRGBO(245, 198, 220, .8),
    800: Color.fromRGBO(245, 198, 220, .9),
    900: Color.fromRGBO(245, 198, 220, 1),
  };

  static const Map<int, Color> secondaryColorContainerSwatch = {
    50: Color.fromRGBO(251, 244, 245, .1),
    100: Color.fromRGBO(251, 244, 245, .2),
    200: Color.fromRGBO(251, 244, 245, .3),
    300: Color.fromRGBO(251, 244, 245, .4),
    400: Color.fromRGBO(251, 244, 245, .5),
    500: Color.fromRGBO(251, 244, 245, .6),
    600: Color.fromRGBO(251, 244, 245, .7),
    700: Color.fromRGBO(251, 244, 245, .8),
    800: Color.fromRGBO(251, 244, 245, .9),
    900: Color.fromRGBO(251, 244, 245, 1),
  };
}
