import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true);

  static final ThemeData lightMode = ThemeData(
    useMaterial3: true,
    fontFamily: 'IBM Plex Sans',
    colorScheme: const ColorScheme.light(
      surface: Colors.white,
      primary: Colors.white,
      secondary: Colors.white,
      primaryContainer: Color(0xff111315),
      secondaryContainer: Color(0xff1C1F23),
    ),
  );

  static final ThemeData darkMode = ThemeData(
    useMaterial3: true,
    fontFamily: 'IBM Plex Sans',
    colorScheme: ColorScheme.dark(
      surface: Colors.black,
      primary: Colors.white,
      secondary: Colors.white,
      primaryContainer: Color(0xff151515),
      secondaryContainer: Color(0xff1C1F23),
    ),
  );

  ThemeData get currentTheme => state ? darkMode : lightMode;

  void toggleTheme() => emit(!state);

  void setTheme(bool isDark) => emit(isDark);
}
