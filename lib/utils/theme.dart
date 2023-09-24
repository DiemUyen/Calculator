import 'package:flutter/material.dart';

import 'app_color.dart';

AppColor colorsByTheme(context) => Theme.of(context).extension<AppColor>()!;

ThemeData getThemeData(BuildContext context) => ThemeData(
      extensions: <AppColor>[
        AppColor(),
      ],
      useMaterial3: true,
    );
