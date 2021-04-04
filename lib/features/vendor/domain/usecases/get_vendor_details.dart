import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_details_entity.dart';
import 'package:gofoodie/features/vendor/domain/repositories/vendor_repository.dart';

class GetVendorDetails implements UseCase<VendorDetailsEntity, Params> {
  final VendorRepository vendorRepository;
  GetVendorDetails(this.vendorRepository);

  @override
  Future<Either<Failure, VendorDetailsEntity>> call(params) async {
    return await vendorRepository.getVendorDetails(vendorId: params.vendorId);
  }
}

class Params extends Equatable {
  final int vendorId;

  Params({@required this.vendorId});

  @override
  List<Object> get props => [vendorId];
}
