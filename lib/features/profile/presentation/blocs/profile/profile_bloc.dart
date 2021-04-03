import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/profile/domain/entities/profile_data.dart';
import 'package:gofoodie/features/profile/domain/usecases/change_email.dart'
    as EmailChangeUseCase;
import 'package:gofoodie/features/profile/domain/usecases/change_name.dart'
    as NameChangeUserCase;
import 'package:gofoodie/features/profile/domain/usecases/get_profile_detail.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileDetail _getProfileDetail;
  final NameChangeUserCase.ChangeName _changeName;
  final EmailChangeUseCase.ChangeEmail _changeEmail;

  ProfileBloc(
      {@required GetProfileDetail getProfileDetail,
      @required NameChangeUserCase.ChangeName changeName,
      @required EmailChangeUseCase.ChangeEmail changeEmail})
      : assert(getProfileDetail != null),
        assert(changeName != null),
        assert(changeEmail != null),
        _getProfileDetail = getProfileDetail,
        _changeName = changeName,
        _changeEmail = changeEmail,
        super(ProfileInitialState());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ProfileLoadEvent) {
      yield ProfileLoadingState();

      final Either result = await _getProfileDetail(NoParams());

      yield result.fold(
        (failure) => ProfileErrorState(message: _mapFailureToMessage(failure)),
        (profileData) => ProfileLoadedState(profileData: profileData),
      );
    } else if (event is ChangeNameEvent) {
      yield ProfileSavingState();

      final Either result = await _changeName(NameChangeUserCase.Params(
          fullName: event.fullName, email: event.profileData.email));

      yield result.fold(
        (failure) => ProfileSavingErrorState(
            message: _mapFailureToMessage(failure),
            profileData: event.profileData),
        (profileData) => ProfileLoadedState(profileData: profileData),
      );
    } else if (event is ChangeEmailEvent) {
      yield ProfileSavingState();

      final Either result = await _changeEmail(EmailChangeUseCase.Params(
          fullName: event.profileData.name, email: event.email));

      yield result.fold(
        (failure) => ProfileSavingErrorState(
            message: _mapFailureToMessage(failure),
            profileData: event.profileData),
        (profileData) => ProfileLoadedState(profileData: profileData),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkNotAvaliableFailure:
        return AppString.noConnection;

      case AuthenticationFailure:
        return AppString.pleaseLoginAgain;

      case RequiredFieldFailure:
        return failure.failureMessage;

      default:
        return AppString.somethingWrong;
    }
  }
}
