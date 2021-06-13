import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/features/order/domain/entities/cart.dart';
import 'package:gofoodie/features/order/domain/entities/cart_products.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_product.dart';

class CartUsecase {
  Cart call(Params params) {
    //If cart is empty
    if (params.cart == null) {
      // Calculate Delivery Minute

      return Cart(
          vendorId: params.vendorId,
          totalAmount: params.vendorProduct.price,
          products: [
            CartProducts(
                id: params.vendorProduct.id,
                name: params.vendorProduct.name,
                imageUrl: params.vendorProduct.imageUrl,
                price: params.vendorProduct.price,
                description: params.vendorProduct.description,
                qty: 1)
          ]);
    }

    Cart cart = params.cart;

    int indexOfSelectedItemInCart = cart.products.indexWhere(
        (CartProducts cartProducts) =>
            cartProducts.id == params.vendorProduct.id);

    // If item is not in cart, then it should be new product to cart.
    if (indexOfSelectedItemInCart == -1) {
      cart.products.add(CartProducts(
          id: params.vendorProduct.id,
          name: params.vendorProduct.name,
          imageUrl: params.vendorProduct.imageUrl,
          price: params.vendorProduct.price,
          description: params.vendorProduct.description));

      cart.totalItems += 1;
      cart.totalAmount += params.vendorProduct.price;
      return cart;
    }

    CartProducts cartProduct = cart.products[indexOfSelectedItemInCart];
    if (params.cartOperation == CartOperation.removeFromCart) {
      int currentQty = cartProduct.qty - 1;
      if (currentQty < 1) {
        cart.products.removeAt(indexOfSelectedItemInCart);
        cart.totalItems -= 1;
      } else {
        cartProduct.qty = currentQty;
      }

      cart.totalAmount -= params.vendorProduct.price;
    } else {
      if (cartProduct.qty != 100) {
        cartProduct.qty += 1;
        cart.totalAmount += params.vendorProduct.price;
      }
    }

    return cart;
  }
}

class Params extends Equatable {
  final CartOperation cartOperation;
  final int vendorId;
  final VendorProduct vendorProduct;
  final Cart cart;

  Params(
      {@required this.cartOperation,
      @required this.vendorId,
      @required this.vendorProduct,
      @required this.cart});

  @override
  List<Object> get props => [vendorId, vendorProduct, cart];
}

enum CartOperation { addToCart, removeFromCart }
