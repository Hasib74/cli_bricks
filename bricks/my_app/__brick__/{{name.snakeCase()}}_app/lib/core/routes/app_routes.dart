import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/presentation/home/home_screen.dart';
import 'package:{{name.snakeCase()}}/presentation/splash/splash_screen.dart';

import '../../presentation/productDetails/product_details_screen.dart';

class AppRoutes {
  static String SPLASH_SCREEN = "/";


  static getAppRoutes() {
    return {
      SPLASH_SCREEN: (BuildContext context) => const SplashScreen(),

    };
  }
}
