import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/settings/domain/entities/profile_data.dart';
import 'package:gofoodie/features/settings/domain/usecases/get_profile_detail.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileDetail _getProfileDetail;

  ProfileBloc({@required GetProfileDetail getProfileDetail})
      : assert(getProfileDetail != null),
        _getProfileDetail = getProfileDetail,
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
