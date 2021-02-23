part of 'splash_screen_bloc.dart';

abstract class SplashScreenState extends Equatable {
  const SplashScreenState();

  @override
  List<Object> get props => [];
}

class SplashScreenInitialState extends SplashScreenState {}

class SplashScreenExitState extends SplashScreenState {
  final String routeName;
  SplashScreenExitState({this.routeName});

  @override
  List<Object> get props => [routeName];
}

class SplashScreenErrorState extends SplashScreenState {
  final String message;

  SplashScreenErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
