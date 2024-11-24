import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure();
}

class FailureWithMessage extends Failure {
  const FailureWithMessage(
    this.message, {
    this.stackTrace,
  });

  final String message;
  final StackTrace? stackTrace;

  @override
  String toString() {
    return '''
    $FailureWithMessage(
      message: $message,
      stackTrace: $stackTrace,
    )
    ''';
  }

  @override
  List<Object?> get props => [
        message,
        stackTrace,
      ];
}
