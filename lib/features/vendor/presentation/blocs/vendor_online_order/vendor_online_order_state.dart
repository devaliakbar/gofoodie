part of 'vendor_online_order_bloc.dart';

abstract class VendorOnlineOrderState extends Equatable {
  const VendorOnlineOrderState();

  @override
  List<Object> get props => [];
}

class VendorProductsLoadingState extends VendorOnlineOrderState {
  final int categoryId;

  VendorProductsLoadingState({@required this.categoryId});

  @override
  List<Object> get props => [categoryId];
}

class VendorProductsLoadedState extends VendorOnlineOrderState {
  final List<VendorProduct> products;

  VendorProductsLoadedState({@required this.products});

  @override
  List<Object> get props => [products];
}

class VendorMoreProductsLoadingState extends VendorOnlineOrderState {
  final List<VendorProduct> products;

  VendorMoreProductsLoadingState({@required this.products});

  @override
  List<Object> get props => [products];
}

class VendorProductsLoadingFailedState extends VendorOnlineOrderState {
  final String message;

  VendorProductsLoadingFailedState({@required this.message});

  @override
  List<Object> get props => [message];
}
