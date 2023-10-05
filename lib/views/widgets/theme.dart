import 'package:flutter/material.dart';

import '../../utils/constants.dart';

const ColorScheme _colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.highlight,
  onPrimary: AppColors.white,
  background: AppColors.background,
  onBackground: AppColors.font,
  secondary: AppColors.background2,
  onSecondary: AppColors.font,
  tertiary: AppColors.background3,
  onTertiary: AppColors.font,
  surface: AppColors.background,
  onSurface: AppColors.font,
  onSurfaceVariant: AppColors.font2,
  onInverseSurface: AppColors.grey,
  error: AppColors.red,
  onError: AppColors.red,
  outline: AppColors.transparent,
  shadow: AppColors.shadow,
);

const IconThemeData _iconTheme = IconThemeData(
  color: AppColors.icon,
  size: AppDecoration.iconSize,
);

final ThemeData applicationLightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "Roboto",
  colorScheme: _colorScheme,
  iconTheme: _iconTheme,
  tooltipTheme: const TooltipThemeData(preferBelow: false),
  appBarTheme: const AppBarTheme(
    scrolledUnderElevation: AppDecoration.elevation,
    shadowColor: AppColors.shadowLight,
    surfaceTintColor: AppColors.transparent,
    titleSpacing: 5.0,
    iconTheme: _iconTheme,
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: _colorScheme.background,
    surfaceTintColor: _colorScheme.background,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: _colorScheme.secondary,
    prefixIconColor: _iconTheme.color,
    suffixIconColor: _iconTheme.color,
    border: UnderlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(AppDecoration.radius),
    ),
    constraints: const BoxConstraints(maxWidth: AppDecoration.widgetWidth),
  ),
  listTileTheme: ListTileThemeData(
    iconColor: _iconTheme.color,
    minVerticalPadding: AppDecoration.padding,
  ),
  dividerTheme: DividerThemeData(
    color: AppColors.black.withOpacity(0.1),
    space: 1.0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: _colorScheme.primary,
      foregroundColor: _colorScheme.onPrimary,
      minimumSize: const Size(
        AppDecoration.minButtonWidth,
        AppDecoration.buttonHeight,
      ),
      maximumSize: const Size(
        AppDecoration.widgetWidth,
        AppDecoration.buttonHeight,
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppDecoration.padding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDecoration.radius),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: AppDecoration.padding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDecoration.radius),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: AppDecoration.padding),
      side: BorderSide(color: _colorScheme.primary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDecoration.radius),
      ),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      minimumSize: const Size(100.0, AppDecoration.buttonHeight),
      maximumSize: const Size(
        AppDecoration.widgetWidth,
        AppDecoration.buttonHeight,
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppDecoration.padding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDecoration.radius),
      ),
    ),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: _colorScheme.secondary,
    surfaceTintColor: AppColors.transparent,
    shadowColor: AppColors.shadowLight,
    elevation: AppDecoration.elevationSmall,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDecoration.radius),
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(_colorScheme.primary),
    trackColor: MaterialStateProperty.all(_colorScheme.secondary),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    surfaceTintColor: AppColors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDecoration.radiusBig),
      ),
    ),
  ),
);

final ColorScheme _colorSchemeDark = _colorScheme.copyWith(
  brightness: Brightness.dark,
  background: AppColors.backgroundDark,
  onBackground: AppColors.fontDark,
  secondary: AppColors.background2Dark,
  onSecondary: AppColors.fontDark,
  tertiary: AppColors.background3Dark,
  onTertiary: AppColors.fontDark,
  surface: AppColors.backgroundDark,
  onSurface: AppColors.fontDark,
  onSurfaceVariant: AppColors.font2Dark,
);

final IconThemeData _iconThemeDark = _iconTheme.copyWith(
  color: AppColors.iconDark,
);

final ThemeData applicationDarkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "Roboto",
  colorScheme: _colorSchemeDark,
  iconTheme: _iconThemeDark,
  tooltipTheme: applicationLightTheme.tooltipTheme,
  appBarTheme: applicationLightTheme.appBarTheme.copyWith(
    iconTheme: _iconThemeDark,
    shadowColor: _colorSchemeDark.shadow,
  ),
  drawerTheme: applicationLightTheme.drawerTheme.copyWith(
    backgroundColor: _colorSchemeDark.background,
    surfaceTintColor: _colorSchemeDark.background,
  ),
  inputDecorationTheme: applicationLightTheme.inputDecorationTheme.copyWith(
    fillColor: _colorSchemeDark.secondary,
    prefixIconColor: _iconThemeDark.color,
    suffixIconColor: _iconThemeDark.color,
  ),
  elevatedButtonTheme: applicationLightTheme.elevatedButtonTheme,
  textButtonTheme: applicationLightTheme.textButtonTheme,
  outlinedButtonTheme: applicationLightTheme.outlinedButtonTheme,
  filledButtonTheme: applicationLightTheme.filledButtonTheme,
  listTileTheme: applicationLightTheme.listTileTheme.copyWith(
    iconColor: _iconThemeDark.color,
  ),
  dividerTheme: applicationLightTheme.dividerTheme.copyWith(
    color: AppColors.white.withOpacity(0.1),
  ),
  popupMenuTheme: applicationLightTheme.popupMenuTheme.copyWith(
    color: _colorSchemeDark.secondary,
    shadowColor: _colorSchemeDark.shadow,
  ),
  switchTheme: applicationLightTheme.switchTheme.copyWith(
    trackColor: MaterialStateProperty.all(_colorSchemeDark.secondary),
  ),
  bottomSheetTheme: applicationLightTheme.bottomSheetTheme,
);
