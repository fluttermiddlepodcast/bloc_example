sealed class Failure {
  const Failure();
}

final class SomeFailure extends Failure {
  final String error;

  const SomeFailure(this.error);

  @override
  String toString() => error;
}
