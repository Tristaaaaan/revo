import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true);

  static final ThemeData lightMode = ThemeData(
    useMaterial3: true,
    fontFamily: 'IBM Plex Sans',
    colorScheme: const ColorScheme.light(
      surface: Colors.white,
      primary: Color(0xff574667),
      onPrimaryContainer: Color(0xff3592E7),
      secondary: Color(0xff2DD7A4),
      tertiary: Color(0xffB47820),
      primaryContainer: Color(0xff111315),
      secondaryContainer: Color(0xff1C1F23),
      inversePrimary: Colors.black,
      inverseSurface: Colors.black,
      tertiaryContainer: Color(0xffDF9652),
      primaryFixedDim: Color(0xff4D5652),
      tertiaryFixedDim: Color(0xffF8D675),
    ),
  );

  static final ThemeData darkMode = ThemeData(
    useMaterial3: true,
    fontFamily: 'IBM Plex Sans',
    colorScheme: ColorScheme.dark(
      surface: Colors.black,
      primary: Colors.white,
      secondary: Colors.white,
      tertiary: const Color.fromARGB(255, 180, 180, 180).withValues(alpha: 0.2),
      inversePrimary: Colors.grey.shade900,
      tertiaryContainer: const Color(0xff939cc4),
      primaryContainer: Color(0xff151515),
    ),
  );

  ThemeData get currentTheme => state ? darkMode : lightMode;

  void toggleTheme() => emit(!state);

  void setTheme(bool isDark) => emit(isDark);
}
