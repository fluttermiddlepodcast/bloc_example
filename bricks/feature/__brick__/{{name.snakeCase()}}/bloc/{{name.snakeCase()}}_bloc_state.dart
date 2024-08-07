import '../model/{{name.snakeCase()}}.dart';

sealed class {{name.pascalCase()}}BlocState {}

class {{name.pascalCase()}}BlocStateLoading extends {{name.pascalCase()}}BlocState {}

class {{name.pascalCase()}}BlocStateLoaded extends {{name.pascalCase()}}BlocState {}

class {{name.pascalCase()}}BlocStateError extends {{name.pascalCase()}}BlocState {}
