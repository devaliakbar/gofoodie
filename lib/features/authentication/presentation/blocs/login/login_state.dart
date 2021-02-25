part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
