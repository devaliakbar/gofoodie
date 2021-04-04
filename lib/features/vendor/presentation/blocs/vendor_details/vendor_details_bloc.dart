import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_details_entity.dart';
import 'package:gofoodie/features/vendor/domain/usecases/get_vendor_details.dart';

part 'vendor_details_event.dart';
part 'vendor_details_state.dart';

class VendorDetailsBloc extends Bloc<VendorDetailsEvent, VendorDetailsState> {
  final GetVendorDetails _getVendorDetails;

  VendorDetailsBloc({@required GetVendorDetails getVendorDetails})
      : assert(getVendorDetails != null),
        _getVendorDetails = getVendorDetails,
        super(VendorDetailsInitialState());

  @override
  Stream<VendorDetailsState> mapEventToState(
    VendorDetailsEvent event,
  ) async* {
    if (event is GetVendorDetailsEvent) {
      yield VendorDetailsLoadingState();

      final Either result =
          await _getVendorDetails(Params(vendorId: event.vendorId));

      yield result.fold(
        (failure) => VendorDetailsErrorState(
          message: _mapFailureToMessage(failure),
        ),
        (vendorDetails) =>
            VendorDetailsLoadedState(vendorDetailsEntity: vendorDetails),
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
