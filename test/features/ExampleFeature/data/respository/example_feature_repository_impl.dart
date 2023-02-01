import 'package:dartz/dartz.dart';
import 'package:../core/error/failures.dart';
import 'package:../core/remoteHelper/responseHelper/app_api_response.dart';
import 'package:../core/remoteHelper/responseHelper/model/model.dart';

import '../../domain/repository/example_feature_repository.dart';
import '../remoteDataSource/example_feature_data_source.dart';

class ExampleFeatureRepositoryImpl extends ExampleFeatureRepository {
  ExampleFeatureRemoteDataSource ExampleFeatureRemoteDataSource;

  ExampleFeatureRepositoryImpl({required this.ExampleFeatureRemoteDataSource});

  @override
  Future<Either<Failure, AppApiResponse<Model>>> getExampleFeatures() {
    return ExampleFeatureRemoteDataSource.getExampleFeaturee();
  }
}
