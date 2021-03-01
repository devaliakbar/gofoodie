import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/failures.dart';
import 'package:gofoodie/core/usecases/usecase.dart';
import 'package:gofoodie/features/home/domain/entities/vendor.dart';
import 'package:gofoodie/features/home/domain/repositories/home_repository.dart';

class GetVendors implements UseCase<List<Vendor>, Params> {
  final HomeRepository homeRepository;

  GetVendors(this.homeRepository);

  @override
  Future<Either<Failure, List<Vendor>>> call(Params params) async {
    return await homeRepository.getVendors(query: params.query);
  }
}

class Params extends Equatable {
  final String query;

  Params({@required this.query});

  @override
  List<Object> get props => [query];
}
