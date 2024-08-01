import 'package:flutter_bloc/flutter_bloc.dart';
import '{{name.snakeCase()}}_bloc_event.dart';
import '{{name.snakeCase()}}_bloc_state.dart';
import '../repository/{{name.snakeCase()}}_repository.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}BlocEvent, {{name.pascalCase()}}BlocState> {
  final {{name.pascalCase()}}Repository {{name}}Repository;

  {{name.pascalCase()}}Bloc({required this.{{name}}Repository}) : super({{name.pascalCase()}}BlocStateLoading()) {}
}
