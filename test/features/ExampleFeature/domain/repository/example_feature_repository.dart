import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/remoteHelper/responseHelper/app_api_response.dart';

abstract class ExampleFeatureRepository {
  Future<Either<Failure, AppApiResponse>> getExampleFeatures();
}
