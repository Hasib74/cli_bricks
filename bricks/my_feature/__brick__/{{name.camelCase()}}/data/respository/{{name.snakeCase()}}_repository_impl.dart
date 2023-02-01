import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/remoteHelper/responseHelper/app_api_response.dart';
import '../../../../core/remoteHelper/responseHelper/model/model.dart';

import '../../domain/repository/{{name.snakeCase()}}_repository.dart';
import '../remoteDataSource/{{name.snakeCase()}}_data_source.dart';

class {{name.pascalCase()}}RepositoryImpl extends {{name.pascalCase()}}Repository {
  {{name.pascalCase()}}RemoteDataSource {{name.camelCase()}}RemoteDataSource;

  {{name.pascalCase()}}RepositoryImpl({required this.{{name.camelCase()}}RemoteDataSource});

  @override
  Future<Either<Failure, AppApiResponse<Model>>> get{{name.pascalCase()}}s() {
    return {{name.camelCase()}}RemoteDataSource.get{{name.pascalCase()}}e();
  }
}
