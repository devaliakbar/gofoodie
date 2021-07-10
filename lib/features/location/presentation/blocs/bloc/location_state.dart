part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitialState extends LocationState {}

class LocationLoadedState extends LocationState {
  final LocationModel location;

  LocationLoadedState({@required this.location});

  @override
  List<Object> get props => [location];
}
