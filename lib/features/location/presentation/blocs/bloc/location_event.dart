part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class SetLocation extends LocationEvent {
  final LocationModel location;

  SetLocation({@required this.location});

  @override
  List<Object> get props => [location];
}
