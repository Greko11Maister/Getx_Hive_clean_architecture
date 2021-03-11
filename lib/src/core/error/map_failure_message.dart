import 'failures.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return (failure as ServerFailure).message;
    default:
      return 'Unexpected error';
  }
}