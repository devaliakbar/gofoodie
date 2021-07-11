part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class ResetCart extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final int vendorId;
  final VendorProduct vendorProduct;

  AddToCartEvent({@required this.vendorId, @required this.vendorProduct});

  @override
  List<Object> get props => [vendorId, vendorProduct];
}

class RemoveFromCartEvent extends CartEvent {
  final int vendorId;
  final VendorProduct vendorProduct;

  RemoveFromCartEvent({@required this.vendorId, @required this.vendorProduct});

  @override
  List<Object> get props => [vendorId, vendorProduct];
}

class TogglePickUpEvent extends CartEvent {}

class AddPhoneEvent extends CartEvent {
  final String phone;
  AddPhoneEvent({@required this.phone});

  @override
  List<Object> get props => [phone];
}
