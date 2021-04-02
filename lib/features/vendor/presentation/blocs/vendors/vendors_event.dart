part of 'vendors_bloc.dart';

abstract class VendorsEvent extends Equatable {
  const VendorsEvent();

  @override
  List<Object> get props => [];
}

class GetVendorsEvent extends VendorsEvent {
  final int categoryId;

  GetVendorsEvent({@required this.categoryId});

  @override
  List<Object> get props => [categoryId];
}
