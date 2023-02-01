import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/app_network.dart';
import '../../../../core/remoteHelper/app_urls.dart';
import '../../../../core/remoteHelper/responseHelper/app_api_response.dart';
import '../../../../core/remoteHelper/responseHelper/model/model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/dependencyInjection/app_dependency_injections.dart';

abstract class {{name.pascalCase()}}RemoteDataSource {
  Future<Either<Failure, AppApiResponse>> get{{name.pascalCase()}}e();
}

class {{name.pascalCase()}}RemoteDataSourceImpl extends {{name.pascalCase()}}RemoteDataSource {
  @override
  Future<Either<Failure, AppApiResponse<Model>>> get{{name.pascalCase()}}e() async {
    print(
        "Is connectedwith internet : ${await sl<AppNetworkInfo>().isConnected}");

    if (await sl<AppNetworkInfo>().isConnected) {
      http.Response _res = await http.get(Uri.parse(AppUri.products));

      print("Current _response :: ${_res.body}");

      return Right(AppApiResponse.data(
        response: _res,
      ));
    } else {
      return Left(NoInternetConnection());
    }
  }
}
