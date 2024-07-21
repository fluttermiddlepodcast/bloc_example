import 'package:bloc_example/features/home/bloc/users_cubit_state.dart';
import 'package:bloc_example/features/home/repository/users_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<UsersCubitState> {
  final UsersRepository usersRepository;

  UsersCubit({required this.usersRepository}) : super(UsersCubitState.initial());

  void fetchUsers() async {
    final usersRes = await usersRepository.fetchUsers();
    if (usersRes.$2 == null) {
      emit(
        state.copyWith(
          users: usersRes.$1!,
          isLoading: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          error: usersRes.$2!,
        ),
      );
    }
  }

  void refresh() async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    fetchUsers();
  }
}
