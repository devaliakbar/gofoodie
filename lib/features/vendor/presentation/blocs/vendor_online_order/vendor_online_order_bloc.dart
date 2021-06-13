import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_product.dart';
import 'package:gofoodie/features/vendor/domain/usecases/get_vendor_products.dart';

part 'vendor_online_order_event.dart';
part 'vendor_online_order_state.dart';

class VendorOnlineOrderBloc
    extends Bloc<VendorOnlineOrderEvent, VendorOnlineOrderState> {
  final GetVendorProducts _getVendorProducts;

  int categoryId;

  VendorOnlineOrderBloc({@required GetVendorProducts getVendorProducts})
      : assert(getVendorProducts != null),
        _getVendorProducts = getVendorProducts,
        super(VendorProductsLoadingState(categoryId: null));

  @override
  Stream<Transition<VendorOnlineOrderEvent, VendorOnlineOrderState>>
      transformEvents(events, transitionFn) {
    return events.switchMap(transitionFn);
  }

  @override
  Stream<VendorOnlineOrderState> mapEventToState(
    VendorOnlineOrderEvent event,
  ) async* {
    if (event is GetVendorProductsEvent) {
      categoryId = event.categoryId;

      yield new VendorProductsLoadingState(categoryId: categoryId);

      final Either result = await _getVendorProducts(
        Params(vendorId: event.vendorId, categoryId: event.categoryId),
      );

      yield result.fold(
        (failure) => VendorProductsLoadingFailedState(
            message: _mapFailureToMessage(failure)),
        (products) {
          return VendorProductsLoadedState(products: products);
        },
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
