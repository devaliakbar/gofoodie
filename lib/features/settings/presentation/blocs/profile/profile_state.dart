part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final ProfileData profileData;
  ProfileLoadedState({@required this.profileData});

  @override
  List<Object> get props => [profileData];
}

class ProfileErrorState extends ProfileState {
  final String message;

  ProfileErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
