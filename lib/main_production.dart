import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/core/appconfig/app_config.dart';
import 'package:revo/shared/enum/shared_enums.dart';

import 'core/approutes/app_routes.dart';
import 'core/appthemes/app_themes.dart';

void main() async {
  AppConfig.setEnvironment(Flavors.production);
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDarkMode) {
        final theme = isDarkMode ? ThemeCubit.darkMode : ThemeCubit.lightMode;

        return MaterialApp.router(
          theme: theme,
          routerConfig: appRouter,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
