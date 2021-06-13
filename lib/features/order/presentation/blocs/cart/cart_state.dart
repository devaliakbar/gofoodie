part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartEmptyState extends CartState {}

class CartLoadedState extends CartState {
  final Cart cart;

  CartLoadedState({@required this.cart});

  @override
  List<Object> get props => [cart];
}
