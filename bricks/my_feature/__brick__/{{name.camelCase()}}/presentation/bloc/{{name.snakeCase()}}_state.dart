part of '{{name.snakeCase()}}_cubit.dart';

abstract class {{name.pascalCase()}}State extends Equatable {
  const {{name.pascalCase()}}State();
}

class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {
  @override
  List<Object> get props => [];
}

class {{name.pascalCase()}}Loading extends {{name.pascalCase()}}State {
  @override
  List<Object> get props => [];
}

class {{name.pascalCase()}}Loaded extends {{name.pascalCase()}}State {
  final {{name.pascalCase()}}Model? {{name.camelCase()}}Model;

  {{name.pascalCase()}}Loaded({this.{{name.camelCase()}}Model}) {
    // print("{{name.pascalCase()}}Model :: ${{{name.pascalCase()}}Model!.limit.toString()}");
  }

  @override
  List<Object> get props => [{{name.camelCase()}}Model!];
}

class {{name.pascalCase()}}Error extends {{name.pascalCase()}}State {
  final String message;

  {{name.pascalCase()}}Error({required this.message});

  @override
  List<Object> get props => [message];
}
