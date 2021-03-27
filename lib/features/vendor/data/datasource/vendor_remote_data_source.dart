import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/services/network/api_helper.dart';
import 'package:gofoodie/features/vendor/data/models/vendor_model.dart';

abstract class VendorRemoteDataSource {
  Future<List<VendorModel>> getVendors({@required String query});
}

class VendorRemoteDataSourceImpl extends VendorRemoteDataSource {
  final ApiHelper apiHelper;

  VendorRemoteDataSourceImpl({@required this.apiHelper});

  @override
  Future<List<VendorModel>> getVendors({String query}) async {
    bool result = await apiHelper.isNetworkConnected();

    if (!result) {
      throw NetworkNotAvaliableException();
    }

    try {
      //TODO
      // Response response = await Dio().get(
      //   apiHelper.appendPath(path: "lose"),
      //   options: await apiHelper.getHeaders(withToken: false),
      // );

      // return HomeModel.fromJson(await response.data);

      await Future.delayed(Duration(seconds: 2));
      List<VendorModel> vendors = [];

      [
        {
          "id": "1",
          "name": "XX",
          "imageUrl":
              "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
        },
        {
          "id": "2",
          "name": "YY",
          "imageUrl":
              "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
        },
        {
          "id": "1",
          "name": "XX",
          "imageUrl":
              "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
        },
        {
          "id": "2",
          "name": "YY",
          "imageUrl":
              "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
        },
        {
          "id": "1",
          "name": "XX",
          "imageUrl":
              "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
        },
        {
          "id": "2",
          "name": "YY",
          "imageUrl":
              "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
        },
        {
          "id": "1",
          "name": "XX",
          "imageUrl":
              "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
        },
        {
          "id": "2",
          "name": "YY",
          "imageUrl":
              "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
        },
      ].forEach(
        (element) {
          vendors.add(VendorModel.fromJson(element));
        },
      );

      return vendors;
    } catch (e) {
      throw UnExpectedException();
    }
  }
}
