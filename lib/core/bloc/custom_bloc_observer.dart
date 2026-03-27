import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  const CustomBlocObserver();

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('--- ${bloc.runtimeType} created');

    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('--- ${bloc.runtimeType} received event: $event');

    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('--- ${bloc.runtimeType} changed state: $change');

    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('--- ${bloc.runtimeType} moved to: $transition');

    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('--- Error in ${bloc.runtimeType}: $error');

    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('--- ${bloc.runtimeType} closed');

    super.onClose(bloc);
  }
}
