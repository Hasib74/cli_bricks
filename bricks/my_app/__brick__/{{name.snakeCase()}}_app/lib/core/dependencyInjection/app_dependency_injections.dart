import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:{{name.snakeCase()}}/core/network/app_network.dart';

import '../../presentation/home/functions/home_functions.dart';

Future intiGetIt() async {
  sl.registerSingleton(SplashScreenFunctions());
  sl.registerSingleton<AppNetworkInfo>(NetworkInfoImpl(Connectivity()));
}
