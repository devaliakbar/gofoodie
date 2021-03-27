import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor.dart';
import 'package:gofoodie/features/vendor/domain/repositories/vendor_repository.dart';

class GetVendors implements UseCase<List<Vendor>, Params> {
  final VendorRepository vendorRepository;

  GetVendors(this.vendorRepository);

  @override
  Future<Either<Failure, List<Vendor>>> call(Params params) async {
    return await vendorRepository.getVendors(query: params.query);
  }
}

class Params extends Equatable {
  final String query;

  Params({@required this.query});

  @override
  List<Object> get props => [query];
}
