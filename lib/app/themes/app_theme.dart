import 'package:flutter/material.dart';
import 'app_colors.dart';  // Asegúrate de importar el archivo de colores

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.indigo,
      primaryColor: AppColors.indigoBase,
      scaffoldBackgroundColor: AppColors.lightBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.indigoBase,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppColors.primaryText),  // Para textos grandes
        bodyMedium: TextStyle(color: AppColors.secondaryText),  // Textos estándar
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.buttonColor,
        textTheme: ButtonTextTheme.primary,
      ),
      iconTheme: IconThemeData(
        color: AppColors.iconColor,
      ),
      cardColor: AppColors.lightBackground,
      dividerColor: AppColors.secondaryText,
    );
  }
}
