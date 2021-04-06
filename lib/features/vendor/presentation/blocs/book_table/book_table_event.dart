part of 'book_table_bloc.dart';

abstract class BookTableEvent extends Equatable {
  const BookTableEvent();

  @override
  List<Object> get props => [];
}

class BookEvent extends BookTableEvent {
  final int numberOfGuest;
  final String dateOfBooking;
  final String name;
  final String email;
  final String phone;
  final int vendorId;

  BookEvent(
      {@required this.numberOfGuest,
      @required this.dateOfBooking,
      @required this.name,
      @required this.email,
      @required this.phone,
      @required this.vendorId});

  @override
  List<Object> get props => [numberOfGuest, dateOfBooking, name, email, phone];
}
