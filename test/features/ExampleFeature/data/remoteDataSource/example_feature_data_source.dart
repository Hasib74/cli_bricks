import 'package:dartz/dartz.dart';
import 'package:../core/error/failures.dart';
import 'package:../core/network/app_network.dart';
import 'package:../core/remoteHelper/app_urls.dart';
import 'package:../core/remoteHelper/responseHelper/app_api_response.dart';
import 'package:../core/remoteHelper/responseHelper/model/model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/dependencyInjection/app_dependency_injections.dart';

abstract class ExampleFeatureRemoteDataSource {
  Future<Either<Failure, AppApiResponse>> getExampleFeaturee();
}

class ExampleFeatureRemoteDataSourceImpl extends ExampleFeatureRemoteDataSource {
  @override
  Future<Either<Failure, AppApiResponse<Model>>> getExampleFeaturee() async {
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
