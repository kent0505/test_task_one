import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData theme = ThemeData(
  useMaterial3: false,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.accent,
  ),
  scaffoldBackgroundColor: AppColors.bg,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.main,
    elevation: 1,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.accent,
    selectionHandleColor: AppColors.accent,
    selectionColor: AppColors.accent,
  ),
);
