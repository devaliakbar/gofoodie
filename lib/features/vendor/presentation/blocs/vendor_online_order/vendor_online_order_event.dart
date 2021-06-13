part of 'vendor_online_order_bloc.dart';

abstract class VendorOnlineOrderEvent extends Equatable {
  const VendorOnlineOrderEvent();

  @override
  List<Object> get props => [];
}

class GetVendorProductsEvent extends VendorOnlineOrderEvent {
  final int vendorId;
  final int categoryId;

  GetVendorProductsEvent({@required this.vendorId, @required this.categoryId});

  @override
  List<Object> get props => [vendorId, categoryId];
}
