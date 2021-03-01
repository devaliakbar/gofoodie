part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final HomeData homeData;
  HomeLoadedState({@required this.homeData});

  @override
  List<Object> get props => [homeData];
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
