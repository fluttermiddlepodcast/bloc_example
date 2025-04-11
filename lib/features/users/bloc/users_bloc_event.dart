import 'package:replay_bloc/replay_bloc.dart';

sealed class UsersBlocEvent extends ReplayEvent {}

class UsersBlocEventFetch extends UsersBlocEvent {
  final bool withRollback;

  UsersBlocEventFetch({this.withRollback = false});
}

class UsersBlocEventFetchMore extends UsersBlocEvent {}

class UsersBlocEventRefresh extends UsersBlocEvent {}
