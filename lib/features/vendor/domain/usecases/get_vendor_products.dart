import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_online_products.dart';
import 'package:gofoodie/features/vendor/domain/repositories/vendor_repository.dart';

class GetVendorProducts extends UseCase<VendorOnlineProducts, Params> {
  final VendorRepository vendorRepository;
  GetVendorProducts(this.vendorRepository);

  @override
  Future<Either<Failure, VendorOnlineProducts>> call(params) async {
    return await vendorRepository.getProducts(apiUrl: params.apiUrl);
  }
}

class Params extends Equatable {
  final String apiUrl;

  Params({
    @required this.apiUrl,
  });

  @override
  List<Object> get props => [apiUrl];
}
