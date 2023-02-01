import '../../featchers/tested/data/remoteDataSource/tested_data_source.dart';
import '../../featchers/tested/data/respository/tested_repository_impl.dart';
import '../../featchers/tested/domain/repository/tested_repository.dart';

import '../../featchers/tested/domain/useCase/tested_use_case.dart';

import '../../featchers/tested/presentation/functions/tested_functions.dart';

import '../../featchers/cart/data/remoteDataSource/cart_data_source.dart';
import '../../featchers/cart/data/respository/cart_repository_impl.dart';
import '../../featchers/cart/domain/repository/cart_repository.dart';

import '../../featchers/cart/domain/useCase/cart_use_case.dart';

import '../../featchers/cart/presentation/functions/cart_functions.dart';

import '../../featchers/great/data/remoteDataSource/great_data_source.dart';
import '../../featchers/great/data/respository/great_repository_impl.dart';
import '../../featchers/great/domain/repository/great_repository.dart';
import '../../featchers/great/domain/useCase/great_use_case.dart';
import '../../featchers/great/presentation/functions/great_functions.dart';
import '../../featchers/aktakicu/data/remoteDataSource/aktakicu_data_source.dart';
import '../../featchers/aktakicu/data/respository/aktakicu_repository_impl.dart';
import '../../featchers/aktakicu/domain/repository/aktakicu_repository.dart';
import '../../featchers/aktakicu/domain/useCase/aktakicu_use_case.dart';
import '../../featchers/aktakicu/presentation/functions/aktakicu_functions.dart';
import '../../featchers/welcome/data/remoteDataSource/welcome_data_source.dart';
import '../../featchers/welcome/data/respository/welcome_repository_impl.dart';
import '../../featchers/welcome/domain/repository/welcome_repository.dart';
import '../../featchers/welcome/domain/useCase/welcome_use_case.dart';
import '../../featchers/welcome/presentation/functions/welcome_functions.dart';
import '../../featchers/test/data/remoteDataSource/test_data_source.dart';
import '../../featchers/test/data/respository/test_repository_impl.dart';
import '../../featchers/test/domain/repository/test_repository.dart';
import '../../featchers/test/domain/useCase/test_use_case.dart';
import '../../featchers/test/presentation/functions/test_functions.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:{{name.snakeCase()}}/core/flavor/app_flavor.dart';
import 'package:{{name.snakeCase()}}/core/network/app_network.dart';
import 'package:{{name.snakeCase()}}/featchers/product/domain/useCase/product_use_case.dart';
import 'package:{{name.snakeCase()}}/featchers/product/presentation/functions/product_functions.dart';
import 'package:get_it/get_it.dart';
import '../../featchers/product/data/remoteDataSource/product_data_source.dart';
import '../../featchers/product/data/respository/product_repository_impl.dart';
import '../../featchers/product/domain/repository/product_repository.dart';
import '../../featchers/splash/functions/splash_screen_functions.dart';

GetIt sl = GetIt.instance;

Future intiGetIt() async {
  sl.registerSingleton<FlavorConfig>(FlavorConfig());
  sl.registerSingleton(SplashScreenFunctions());

  //network

  if (sl<FlavorConfig>().flavor == null) {
    sl.registerSingleton<AppNetworkInfo>(MockConnectivity());
  } else {
    sl.registerSingleton<AppNetworkInfo>(NetworkInfoImpl(Connectivity()));
  }

  //functions
  sl.registerLazySingleton(() => ProductFunctions());

  //data source
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl());

  //repository
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(productRemoteDataSource: sl()));


}
