import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/services/network/api_helper.dart';
import 'package:gofoodie/features/vendor/data/models/vendor_details_model.dart';
import 'package:gofoodie/features/vendor/data/models/vendor_model.dart';

abstract class VendorRemoteDataSource {
  Future<List<VendorModel>> getVendors({@required int categoryId});
  Future<VendorDetailsModel> getVendorDetails({@required int vendorId});
}

class VendorRemoteDataSourceImpl extends VendorRemoteDataSource {
  final ApiHelper apiHelper;

  VendorRemoteDataSourceImpl({@required this.apiHelper});

  @override
  Future<List<VendorModel>> getVendors({int categoryId}) async {
    bool result = await apiHelper.isNetworkConnected();

    if (!result) {
      throw NetworkNotAvaliableException();
    }

    Response response = await Dio().get(
      apiHelper.appendPath(
          path: "resturantlistwithcategory/$categoryId?order=DESC"),
      options: await apiHelper.getHeaders(withToken: false),
    );

    if (response.statusCode == 200) {
      var jsonResponce = await response.data;

      List<VendorModel> vendors = [];

      jsonResponce['data']['data'].forEach((element) {
        vendors.add(VendorModel.fromJson(element));
      });

      return vendors;
    }
    throw UnExpectedException();
  }

  @override
  Future<VendorDetailsModel> getVendorDetails({int vendorId}) async {
    bool result = await apiHelper.isNetworkConnected();

    if (!result) {
      throw NetworkNotAvaliableException();
    }

    Response response = await Dio().get(
      apiHelper.appendPath(path: "restaurant/$vendorId"),
      options: await apiHelper.getHeaders(withToken: false),
    );

    if (response.statusCode == 200) {
      var jsonResponce = await response.data;

      return VendorDetailsModel.fromJson(jsonResponce);
    }
    throw UnExpectedException();
  }
}
