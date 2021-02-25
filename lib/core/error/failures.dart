import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties = const <dynamic>[];

  Failure([properties]);

  @override
  List<Object> get props => properties;
}

class DataStorageFailure extends Failure {}

class NetworkErrorFailure extends Failure {}

class NetworkNotAvaliableFailure extends Failure {}

class IncorrectCredentialsFailure extends Failure {}

class AuthenticationFailure extends Failure {}
