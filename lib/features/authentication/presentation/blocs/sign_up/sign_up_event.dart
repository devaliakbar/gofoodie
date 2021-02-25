part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpResetEvent extends SignUpEvent {}

class SignUpUserEvent extends SignUpEvent {
  final String fullName;
  final String email;
  final String password;

  SignUpUserEvent(
      {@required this.fullName, @required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
