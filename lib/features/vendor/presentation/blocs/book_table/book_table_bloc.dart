import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/features/vendor/domain/usecases/book_table.dart';

part 'book_table_event.dart';
part 'book_table_state.dart';

class BookTableBloc extends Bloc<BookTableEvent, BookTableState> {
  final BookTable _bookTable;

  BookTableBloc({BookTable bookTable})
      : assert(bookTable != null),
        _bookTable = bookTable,
        super(BookTableInitialState());

  @override
  Stream<BookTableState> mapEventToState(
    BookTableEvent event,
  ) async* {
    if (event is BookEvent) {
      yield BookTableLoadingState();

      final Either result = await _bookTable(
        Params(
            numberOfGuest: event.numberOfGuest,
            dateOfBooking: event.dateOfBooking,
            name: event.name,
            email: event.email,
            phone: event.phone,
            vendorId: event.vendorId),
      );

      yield result.fold(
        (failure) =>
            BookTableErrorState(message: _mapFailureToMessage(failure)),
        (success) => BookTableInitialState(),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkNotAvaliableFailure:
        return AppString.noConnection;

      case AuthenticationFailure:
        return AppString.pleaseLoginAgain;

      default:
        return AppString.somethingWrong;
    }
  }
}
