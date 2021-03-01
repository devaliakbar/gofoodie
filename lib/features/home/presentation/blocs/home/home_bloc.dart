import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/home/domain/entities/home_data.dart';
import 'package:gofoodie/features/home/domain/usecases/get_home_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeData _getHomeData;

  HomeBloc({@required GetHomeData getHomeData})
      : assert(getHomeData != null),
        _getHomeData = getHomeData,
        super(HomeInitialState());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetHomeDataEvent) {
      yield HomeLoadingState();

      final Either result = await _getHomeData(NoParams());

      yield result.fold(
        (failure) => HomeErrorState(message: _mapFailureToMessage(failure)),
        (homeData) => HomeLoadedState(homeData: homeData),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkNotAvaliableFailure:
        return AppString.noConnection;
      default:
        return AppString.somethingWrong;
    }
  }
}
