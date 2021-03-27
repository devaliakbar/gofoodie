import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor.dart';
import 'package:gofoodie/features/vendor/domain/usecases/get_vendors.dart';

part 'vendors_event.dart';
part 'vendors_state.dart';

class VendorsBloc extends Bloc<VendorsEvent, VendorsState> {
  final GetVendors _getVendors;

  VendorsBloc({@required GetVendors getVendors})
      : assert(getVendors != null),
        _getVendors = getVendors,
        super(VendorsInitialState());

  @override
  Stream<VendorsState> mapEventToState(
    VendorsEvent event,
  ) async* {
    if (event is GetVendorsEvent) {
      yield VendorsLoadingState();

      final Either result = await _getVendors(Params(query: event.query));

      yield result.fold(
        (failure) => VendorsErrorState(message: _mapFailureToMessage(failure)),
        (vendors) => VendorsLoadedState(vendors: vendors),
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
