import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/features/authentication/domain/usecases/sign_up.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final PerformSignUp _performSignUp;

  SignUpBloc({@required PerformSignUp performSignUp})
      : assert(performSignUp != null),
        _performSignUp = performSignUp,
        super(SignUpInitialState());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is SignUpResetEvent) {
      yield SignUpInitialState();
    } else if (event is SignUpUserEvent) {
      yield SignUpLoadingState();

      final Either result = await _performSignUp(
        Params(
            fullName: event.fullName,
            email: event.email,
            password: event.password),
      );

      yield result.fold(
        (failure) => SignUpErrorState(message: _mapFailureToMessage(failure)),
        (success) => SignUpSuccessState(),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkNotAvaliableFailure:
        return AppString.noConnection;
      case IncorrectCredentialsFailure:
        return AppString.incorrectCredentials;
      case RequiredFieldFailure:
        return failure.failureMessage;
      default:
        return AppString.somethingWrong;
    }
  }
}
