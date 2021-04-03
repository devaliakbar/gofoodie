part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileLoadEvent extends ProfileEvent {}

class ChangeNameEvent extends ProfileEvent {
  final String fullName;
  final ProfileData profileData;

  ChangeNameEvent({@required this.fullName, @required this.profileData});

  @override
  List<Object> get props => [fullName, profileData];
}

class ChangeEmailEvent extends ProfileEvent {
  final String email;
  final ProfileData profileData;

  ChangeEmailEvent({@required this.email, @required this.profileData});

  @override
  List<Object> get props => [email, profileData];
}

class ChangePasswordEvent extends ProfileEvent {
  final String oldPassword;
  final String newPassword;
  final ProfileData profileData;

  ChangePasswordEvent(
      {@required this.oldPassword,
      @required this.newPassword,
      @required this.profileData});

  @override
  List<Object> get props => [oldPassword, newPassword, profileData];
}
