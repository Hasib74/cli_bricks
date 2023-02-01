import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/dependencyInjection/app_dependency_injections.dart';
import '../../domain/model/{{name.snakeCase()}}_model.dart';
import '../../domain/repository/{{name.snakeCase()}}_repository.dart';
import '../../domain/useCase/{{name.snakeCase()}}_use_case.dart';
import '../functions/{{name.snakeCase()}}_functions.dart';

part '{{name.snakeCase()}}_state.dart';

//	{{name.pascalCase()}}

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}UseCase? {{name.camelCase()}}UseCase;

  {{name.pascalCase()}}Cubit({this.{{name.camelCase()}}UseCase}) : super({{name.pascalCase()}}Initial());

  fetch{{name.pascalCase()}}() async {
    emit({{name.pascalCase()}}Loading());
    try {
      Either<Failure, {{name.pascalCase()}}Model>? {{name.camelCase()}}s =
          await sl<{{name.pascalCase()}}Functions>().get{{name.pascalCase()}}s({{name.camelCase()}}UseCase, emit);

     {{name.camelCase()}}s.fold((l) {
        emit({{name.pascalCase()}}Error(message: l.toString()));
      }, (r) {
        print("products : ${r.products}");
        emit({{name.pascalCase()}}Loaded({{name.camelCase()}}Model: r));
      });
    } catch (e) {
      print("The error is : ${e.toString()}");
    }
  }
}
