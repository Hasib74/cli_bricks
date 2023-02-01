import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:great_app/core/network/app_network.dart';


import '../../data/remoteDataSource/product_data_source.dart';
import '../../data/respository/quiz_repository_impl.dart';
import '../../domain/useCase/product_use_case.dart';
import '../../presentation/home/functions/home_functions.dart';

Future intiGetIt() async {
  sl.registerSingleton(SplashScreenFunctions());
  sl.registerSingleton<AppNetworkInfo>(NetworkInfoImpl(Connectivity()));
}
