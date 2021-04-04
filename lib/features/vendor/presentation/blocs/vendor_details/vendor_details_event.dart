part of 'vendor_details_bloc.dart';

abstract class VendorDetailsEvent extends Equatable {
  const VendorDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetVendorDetailsEvent extends VendorDetailsEvent {
  final int vendorId;

  GetVendorDetailsEvent({@required this.vendorId});

  @override
  List<Object> get props => [vendorId];
}
