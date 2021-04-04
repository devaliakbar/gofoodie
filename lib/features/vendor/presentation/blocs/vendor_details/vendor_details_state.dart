part of 'vendor_details_bloc.dart';

abstract class VendorDetailsState extends Equatable {
  const VendorDetailsState();

  @override
  List<Object> get props => [];
}

class VendorDetailsInitialState extends VendorDetailsState {}

class VendorDetailsLoadingState extends VendorDetailsState {}

class VendorDetailsLoadedState extends VendorDetailsState {
  final VendorDetailsEntity vendorDetailsEntity;
  VendorDetailsLoadedState({@required this.vendorDetailsEntity});

  @override
  List<Object> get props => [vendorDetailsEntity];
}

class VendorDetailsErrorState extends VendorDetailsState {
  final String message;

  VendorDetailsErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
