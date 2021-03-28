import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/profile/domain/entities/profile_data.dart';
import 'package:gofoodie/features/profile/domain/usecases/change_name.dart';
import 'package:gofoodie/features/profile/domain/usecases/get_profile_detail.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileDetail _getProfileDetail;
  final ChangeName _changeName;

  ProfileBloc(
      {@required GetProfileDetail getProfileDetail,
      @required ChangeName changeName})
      : assert(getProfileDetail != null),
        assert(changeName != null),
        _getProfileDetail = getProfileDetail,
        _changeName = changeName,
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

      final Either result = await _changeName(
          Params(fullName: event.fullName, email: event.email));

      yield result.fold(
        (failure) =>
            ProfileSavingErrorState(message: _mapFailureToMessage(failure)),
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

      default:
        return AppString.somethingWrong;
    }
  }
}
