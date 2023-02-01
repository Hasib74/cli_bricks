import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/remoteHelper/responseHelper/app_api_response.dart';
import '../../../../core/remoteHelper/responseHelper/model/model.dart';
import '../../../../core/useCase/useCase.dart';

import '../repository/{{name.snakeCase()}}_repository.dart';

class {{name.pascalCase()}}UseCase extends UseCase<AppApiResponse, {{name.pascalCase()}}Params> {
  {{name.pascalCase()}}Repository? {{name.variable.camelCase()}}eRepository;

  {{name.pascalCase()}}UseCase({required this.{{name.variable.camelCase()}}eRepository});

  @override
  Future<Either<Failure, AppApiResponse<Model>>> call(
      {{name.pascalCase()}}Params params) async {
    if (params is Get{{name.pascalCase()}}Parms) {
      print("Get{{name.variable.camelCase()}}Parms");
      return {{name.variable.camelCase()}}eRepository!.get{{name.pascalCase()}}s();
    } else {
      return Left(UnImplement());
    }
  }
}

class {{name.pascalCase()}}Params extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Get{{name.pascalCase()}}Parms extends {{name.pascalCase()}}Params {
  Get{{name.pascalCase()}}Parms() {
    print("GetProductParms");
  }
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
