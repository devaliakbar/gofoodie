import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/services/network/api_helper.dart';
import 'package:gofoodie/features/vendor/data/models/vendor_details_model.dart';
import 'package:gofoodie/features/vendor/data/models/vendor_model.dart';
import 'package:gofoodie/features/vendor/data/models/vendor_online_products_model.dart';

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

  Future<VendorOnlineProductsModel> getVendorProducts(
      {@required String apiUrl});
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
  Future<VendorOnlineProductsModel> getVendorProducts({String apiUrl}) async {
    bool result = await apiHelper.isNetworkConnected();

    if (!result) {
      throw NetworkNotAvaliableException();
    }
    await Future.delayed(Duration(seconds: 2));
    try {
      // TODO
      // Response response = await Dio().get(
      //   apiUrl,
      //   options: await apiHelper.getHeaders(withToken: false),
      // );

      List<Map<String, dynamic>> prods = [];

      for (int i = 0; i < 12; i++) {
        prods.add({
          "id": (i + 1),
          "name": "Product ${(i + 1)}",
          "imageUrl":
              "https://www.esquireme.com/public/styles/full_img/public/images/2016/08/25/Burger.jpg?itok=UeqqTuYy",
          "price": 32.00,
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
        });
      }

      return VendorOnlineProductsModel.fromJson(
          {"next_page": "***", "products": prods});
    } catch (e) {
      throw UnExpectedException();
    }
  }
}
