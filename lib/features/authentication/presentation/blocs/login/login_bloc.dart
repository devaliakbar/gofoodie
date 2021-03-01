import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/features/authentication/domain/usecases/login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final PerformLogin _performLogin;

  LoginBloc({@required PerformLogin performLogin})
      : assert(performLogin != null),
        _performLogin = performLogin,
        super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginResetEvent) {
      yield LoginInitialState();
    } else if (event is LoginUserEvent) {
      yield LoginLoadingState();

      final Either result = await _performLogin(
        Params(email: event.email, password: event.password),
      );

      yield result.fold(
        (failure) => LoginErrorState(message: _mapFailureToMessage(failure)),
        (success) => LoginSuccessState(),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkNotAvaliableFailure:
        return AppString.noConnection;
      case IncorrectCredentialsFailure:
        return AppString.incorrectCredentials;
      default:
        return AppString.somethingWrong;
    }
  }
}
