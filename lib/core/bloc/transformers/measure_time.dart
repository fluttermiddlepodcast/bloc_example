import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Example:
///
/// on<MyEvent>(
///   _onEvent,
///   transformer: measureTime<MyEvent>(
///     blocName: 'MyBloc',
///   ),
/// );
///
EventTransformer<E> measureTime<E>({
  String? blocName,
}) {
  return (events, mapper) {
    return events.asyncExpand(
      (event) {
        final stopwatch = Stopwatch()..start();
        final eventName = event.toString();
        final blocPrefix = blocName != null ? '[$blocName]' : '';

        debugPrint('$blocPrefix ⏱️ Event STARTED: $eventName');

        final controller = StreamController<E>();

        mapper(event).listen(
          controller.add,
          onError: controller.addError,
          onDone: () {
            stopwatch.stop();
            debugPrint('$blocPrefix ⏱️ $eventName: ${stopwatch.elapsedMilliseconds} ms');
            controller.close();
          },
        );

        return controller.stream;
      },
    );
  };
}
