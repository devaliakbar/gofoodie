part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileLoadEvent extends ProfileEvent {}

class ChangeNameEvent extends ProfileEvent {
  final String fullName;
  final String email;

  ChangeNameEvent({@required this.fullName, @required this.email});

  @override
  List<Object> get props => [fullName, email];
}

class ChangeEmailEvent extends ProfileEvent {
  final String fullName;
  final String email;

  ChangeEmailEvent({@required this.fullName, @required this.email});

  @override
  List<Object> get props => [fullName, email];
}
