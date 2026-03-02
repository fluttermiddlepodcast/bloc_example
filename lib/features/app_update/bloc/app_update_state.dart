sealed class AppUpdateState {}

class AppUpdateStateLoading extends AppUpdateState {}

class AppUpdateStateLoaded extends AppUpdateState {
  final bool needUpdate;
  final bool forceUpdate;

  AppUpdateStateLoaded({
    required this.needUpdate,
    required this.forceUpdate,
  });
}

class AppUpdateStateError extends AppUpdateState {}
