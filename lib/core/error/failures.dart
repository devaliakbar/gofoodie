import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String failureMessage;

  Failure({this.failureMessage});

  @override
  List<Object> get props => [failureMessage];
}

class DataStorageFailure extends Failure {}

class UnExpectedFailure extends Failure {}

class NetworkNotAvaliableFailure extends Failure {}

class IncorrectCredentialsFailure extends Failure {}

class AuthenticationFailure extends Failure {}

class RequiredFieldFailure extends Failure {
  RequiredFieldFailure(String mFailureMessage)
      : super(failureMessage: mFailureMessage);
}
