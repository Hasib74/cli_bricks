
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
