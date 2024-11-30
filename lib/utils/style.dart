import 'package:flutter/material.dart';

import 'palette.dart';

class AppStyles {
  static ThemeData theme = ThemeData(
        fontFamily: 'GeneralSans',
        fontFamilyFallback: const ['GeneralSans'],
        scaffoldBackgroundColor: AppPalette.scaffoldBackgroundColor,
      );
}
