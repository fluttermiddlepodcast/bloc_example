import 'package:bloc_example/features/app_update/bloc/app_update_event.dart';
import 'package:bloc_example/features/app_update/bloc/app_update_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppUpdateBloc extends Bloc<AppUpdateEvent, AppUpdateState> {
  AppUpdateBloc() : super(AppUpdateStateLoading()) {
    on<AppUpdateEventInit>(_onInit);
    on<AppUpdateEventSkip>(_onSkip);
  }

  void _onInit(_, Emitter<AppUpdateState> emit) {
    if (const bool.fromEnvironment('APP_UPDATE_ERROR')) {
      emit(AppUpdateStateError());
    } else {
      emit(
        AppUpdateStateLoaded(
          needUpdate: const bool.fromEnvironment('APP_UPDATE'),
          forceUpdate: const bool.fromEnvironment('APP_UPDATE_FORCE'),
        ),
      );
    }
  }

  void _onSkip(_, Emitter<AppUpdateState> emit) async {
    emit(
      AppUpdateStateLoaded(
        needUpdate: false,
        forceUpdate: false,
      ),
    );
  }
}
