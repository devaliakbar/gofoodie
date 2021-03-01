part of 'vendors_bloc.dart';

abstract class VendorsState extends Equatable {
  const VendorsState();

  @override
  List<Object> get props => [];
}

class VendorsInitialState extends VendorsState {}

class VendorsLoadingState extends VendorsState {}

class VendorsLoadedState extends VendorsState {
  final List<Vendor> vendors;
  VendorsLoadedState({@required this.vendors});

  @override
  List<Object> get props => [vendors];
}

class VendorsErrorState extends VendorsState {
  final String message;

  VendorsErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
