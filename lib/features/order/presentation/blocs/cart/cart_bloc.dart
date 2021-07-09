import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/features/order/domain/entities/cart.dart';
import 'package:gofoodie/features/order/domain/usecases/cart_usecase.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartUsecase _cartUsecase;

  CartBloc({@required CartUsecase cartUsecase})
      : assert(cartUsecase != null),
        this._cartUsecase = cartUsecase,
        super(CartEmptyState());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    Cart cart;
    if (state is CartLoadedState) {
      cart = (state as CartLoadedState).cart;
    }

    yield CartEmptyState();

    if (event is AddToCartEvent) {
      yield CartLoadedState(
        cart: _cartUsecase.call(
          Params(
              cartOperation: CartOperation.addToCart,
              vendorId: event.vendorId,
              vendorProduct: event.vendorProduct,
              cart: cart),
        ),
      );
    } else if (event is RemoveFromCartEvent) {
      Cart mCart = _cartUsecase.call(
        Params(
            cartOperation: CartOperation.removeFromCart,
            vendorId: event.vendorId,
            vendorProduct: event.vendorProduct,
            cart: cart),
      );

      if (mCart.products.length > 0) {
        yield CartLoadedState(
          cart: cart,
        );
      }
    } else if (event is TogglePickUpEvent) {
      cart.doesUserPickUp = !cart.doesUserPickUp;
      yield CartLoadedState(
        cart: cart,
      );
    }
  }
}
