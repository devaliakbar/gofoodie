import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/services/network/api_helper.dart';
import 'package:gofoodie/features/vendor/data/models/vendor_details_model.dart';
import 'package:gofoodie/features/vendor/data/models/vendor_model.dart';
import 'package:gofoodie/features/vendor/data/models/vendor_product_model.dart';

abstract class VendorRemoteDataSource {
  Future<List<VendorModel>> getVendors({@required int categoryId});
  Future<VendorDetailsModel> getVendorDetails({@required int vendorId});
  Future<bool> bookTable(
      {@required int numberOfGuest,
      @required String dateOfBooking,
      @required String name,
      @required String email,
      @required String phone,
      @required int vendorId});

  Future<List<VendorProductModel>> getVendorProducts(
      {@required int vendorId, @required int categoryId});
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

  @override
  Future<bool> bookTable(
      {int numberOfGuest,
      String dateOfBooking,
      String name,
      String email,
      String phone,
      int vendorId}) async {
    bool result = await apiHelper.isNetworkConnected();

    if (!result) {
      throw NetworkNotAvaliableException();
    }

    try {
      await Dio().post(apiHelper.appendPath(path: "customer/table/booking"),
          options: await apiHelper.getHeaders(withToken: false),
          data: {
            "number_of_gutes": numberOfGuest,
            "date": dateOfBooking,
            "name": name,
            "email": email,
            "mobile": phone,
            "vendor_id": vendorId
          });

      return true;
    } on DioError catch (e) {
      if (e.response.statusCode == 401) {
        throw AuthenticationException();
      } else {
        throw UnExpectedException();
      }
    }
  }

  @override
  Future<List<VendorProductModel>> getVendorProducts(
      {@required int vendorId, @required int categoryId}) async {
    bool result = await apiHelper.isNetworkConnected();

    if (!result) {
      throw NetworkNotAvaliableException();
    }

    String api = apiHelper.appendPath(path: "products?vendor_id=$vendorId");
    if (categoryId != null) {
      api += "&category_id=$categoryId";
    }

    try {
      Response response = await Dio().post(
        api,
        options: await apiHelper.getHeaders(withToken: false),
      );

      if (response.statusCode != 200) {
        throw UnExpectedException();
      }

      var jsonResponce = await response.data;

      final List<VendorProductModel> products = [];

      jsonResponce['products'].forEach((element) {
        print(element);
        products.add(VendorProductModel.fromJson(element));
      });

      return products;
    } catch (e) {
      throw UnExpectedException();
    }
  }
}
