part of 'book_table_bloc.dart';

abstract class BookTableState extends Equatable {
  const BookTableState();

  @override
  List<Object> get props => [];
}

class BookTableInitialState extends BookTableState {}

class BookTableLoadingState extends BookTableState {}

class BookTableErrorState extends BookTableState {
  final String message;

  BookTableErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
