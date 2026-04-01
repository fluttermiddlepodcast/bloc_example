import 'package:bloc_example/core/network/failure.dart';

sealed class Result<T> {
  const Result();

  factory Result.ok(T value) = Ok<T>;

  factory Result.err(Failure failure) = Err<T>;

  R fold<R>({
    required R Function(Failure) onErr,
    required R Function(T) onOk,
  }) => switch (this) {
    Err<T>(:final failure) => onErr(failure),
    Ok<T>(:final value) => onOk(value),
  };
}

final class Ok<T> extends Result<T> {
  final T value;

  const Ok(this.value);
}

final class Err<T> extends Result<T> {
  final Failure failure;

  const Err(this.failure);
}
