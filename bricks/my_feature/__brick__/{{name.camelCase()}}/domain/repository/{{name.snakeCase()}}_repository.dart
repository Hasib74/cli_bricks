import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/remoteHelper/responseHelper/app_api_response.dart';

abstract class {{name.pascalCase()}}Repository {
  Future<Either<Failure, AppApiResponse>> get{{name.pascalCase()}}s();
}
