import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/remoteHelper/responseHelper/app_api_response.dart';
import '../../domain/model/{{name.snakeCase()}}_model.dart';
import '../../domain/useCase/{{name.snakeCase()}}_use_case.dart';
import '../bloc/{{name.snakeCase()}}_cubit.dart';
import '../../domain/model/{{name.snakeCase()}}_model.dart';

class {{name.pascalCase()}}Functions {
  {{name.pascalCase()}}Model? {{name.camelCase()}}Model;

  Future<Either<Failure, {{name.pascalCase()}}Model>> get{{name.pascalCase()}}s(
      {{name.pascalCase()}}UseCase? {{name.camelCase()}}UseCase,
      void Function({{name.pascalCase()}}State state) emit) async {
    print("get{{name.pascalCase()}}s");

    emit({{name.pascalCase()}}Loading());
    return {{name.camelCase()}}UseCase!.call(Get{{name.pascalCase()}}Parms()).then((value) {
      if (value.isRight()) {
        AppApiResponse? _data = value.getOrElse(() => AppApiResponse());
        {{name.pascalCase()}}Model _{{name.camelCase()}}Model =
            {{name.pascalCase()}}Model.fromJson(jsonDecode(_data.body!));
        //emit({{name.pascalCase()}}Loaded({{name.pascalCase()}}Model: _{{name.pascalCase()}}Model));

        {{name.camelCase()}}Model = _{{name.camelCase()}}Model;
        return Right(_{{name.camelCase()}}Model);
      } else {
        //emit({{name.pascalCase()}}Error(message: value.fold((l) => l.toString(), (r) => "")));
        return Left(value.fold((l) => l, (r) => UnImplement()));
      }
    });
  }
}
