import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_product.dart';
import 'package:gofoodie/features/vendor/domain/repositories/vendor_repository.dart';

class GetVendorProducts extends UseCase<List<VendorProduct>, Params> {
  final VendorRepository vendorRepository;
  GetVendorProducts(this.vendorRepository);

  @override
  Future<Either<Failure, List<VendorProduct>>> call(params) async {
    return await vendorRepository.getProducts(
        vendorId: params.vendorId, categoryId: params.categoryId);
  }
}

class Params extends Equatable {
  final int vendorId;
  final int categoryId;

  Params({@required this.categoryId, @required this.vendorId});

  @override
  List<Object> get props => [categoryId, vendorId];
}
