import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/welcome/domain/usecases/get_route.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final GetRoute _getRoute;

  SplashScreenBloc({
    @required GetRoute getRoute,
  })  : assert(getRoute != null),
        _getRoute = getRoute,
        super(SplashScreenInitialState());

  @override
  Stream<SplashScreenState> mapEventToState(
    SplashScreenEvent event,
  ) async* {
    if (event is SplashScreenGetRouteEvent) {
      final Either result = await _getRoute(NoParams());
      yield result.fold(
          (l) => SplashScreenErrorState(message: tr("data_storage_failure")),
          (r) => SplashScreenExitState(routeName: r));
    }
  }
}
