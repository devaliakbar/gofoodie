part of 'vendor_online_order_bloc.dart';

abstract class VendorOnlineOrderEvent extends Equatable {
  const VendorOnlineOrderEvent();

  @override
  List<Object> get props => [];
}

class GetVendorProductsEvent extends VendorOnlineOrderEvent {
  final int categoryId;

  GetVendorProductsEvent({@required this.categoryId});

  @override
  List<Object> get props => [categoryId];
}

class LoadMoreVendorProductsEvent extends VendorOnlineOrderEvent {
  final List<VendorProduct> products;

  LoadMoreVendorProductsEvent({@required this.products});

  @override
  List<Object> get props => [products];
}
