import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/config/app_config.dart';
import 'package:revo/core/approutes/app_routes.dart';
import 'package:revo/core/appthemes/app_themes.dart';
import 'package:revo/shared/enum/shared_enums.dart';

void main() async {
  AppConfig.setEnvironment(Flavors.development);

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    BlocProvider(create: (context) => ThemeCubit(), child: const MainApp()),
  );
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
