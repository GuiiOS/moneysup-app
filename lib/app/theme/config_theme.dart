import 'package:app/app/theme/colors_theme.dart';
import 'package:app/app/theme/text_theme.dart';
import 'package:app/app/theme/widget_theme.dart';
import 'package:flutter/material.dart';

class ThemeConfig {
  ThemeConfig._();

  static final colors = ColorsApp.instance;

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.grey[300]!),
  );

  static final theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: colors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: colors.background,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(color: colors.textWhite),
      iconTheme: IconThemeData(
        color: colors.textWhite,
      ),
    ),
    primaryColor: colors.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: colors.primary,
      primary: colors.primary,
      secondary: colors.secondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.instance.primaryButton,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: colors.background,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(16),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle:
          TextStyles.instance.textRegular.copyWith(color: colors.textWhite),
      errorStyle:
          TextStyles.instance.textRegular.copyWith(color: Colors.redAccent),
    ),
  );
}
