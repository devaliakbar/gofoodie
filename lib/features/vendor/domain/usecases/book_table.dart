import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/vendor/domain/repositories/vendor_repository.dart';

class BookTable implements UseCase<bool, Params> {
  final VendorRepository vendorRepository;
  BookTable(this.vendorRepository);

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await vendorRepository.bookTable(
        numberOfGuest: params.numberOfGuest,
        dateOfBooking: params.dateOfBooking,
        name: params.name,
        email: params.email,
        phone: params.phone,
        vendorId: params.vendorId);
  }
}

class Params extends Equatable {
  final int numberOfGuest;
  final String dateOfBooking;
  final String name;
  final String email;
  final String phone;
  final int vendorId;

  Params(
      {@required this.numberOfGuest,
      @required this.dateOfBooking,
      @required this.name,
      @required this.email,
      @required this.phone,
      @required this.vendorId});

  @override
  List<Object> get props => [numberOfGuest, dateOfBooking, name, email, phone];
}
