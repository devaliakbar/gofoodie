part of 'vendors_bloc.dart';

abstract class VendorsEvent extends Equatable {
  const VendorsEvent();

  @override
  List<Object> get props => [];
}

class GetVendorsEvent extends VendorsEvent {
  final String query;

  GetVendorsEvent({@required this.query});

  @override
  List<Object> get props => [query];
}
