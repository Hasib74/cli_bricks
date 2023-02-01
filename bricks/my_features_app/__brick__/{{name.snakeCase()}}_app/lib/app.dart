import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/core/routes/app_routes.dart';
import 'package:{{name.snakeCase()}}/core/themes/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeDataLight,
      routes: AppRoutes.getAppRoutes(),
      initialRoute: AppRoutes.SPLASH_SCREEN,
    );
  }
}
