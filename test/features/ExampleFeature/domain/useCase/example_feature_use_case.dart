import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:../core/error/failures.dart';
import 'package:../core/remoteHelper/responseHelper/app_api_response.dart';
import 'package:../core/remoteHelper/responseHelper/model/model.dart';
import 'package:../core/useCase/useCase.dart';

import '../repository/example_feature_repository.dart';

class ExampleFeatureUseCase extends UseCase<AppApiResponse, ExampleFeatureParams> {
  ExampleFeatureRepository? eRepository;

  ExampleFeatureUseCase({required this.eRepository});

  @override
  Future<Either<Failure, AppApiResponse<Model>>> call(
      ExampleFeatureParams params) async {
    if (params is GetExampleFeatureParms) {
      print("GetParms");
      return eRepository!.getExampleFeatures();
    } else {
      return Left(UnImplement());
    }
  }
}

class ExampleFeatureParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetExampleFeatureParms extends ExampleFeatureParams {
  GetExampleFeatureParms() {
    print("GetProductParms");
  }
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
