import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/services/network/api_helper.dart';
import 'package:gofoodie/features/home/data/models/home_model.dart';
import 'package:gofoodie/features/home/data/models/vendor_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> getHomeData();
  Future<List<VendorModel>> getVendors({@required String query});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiHelper apiHelper;

  HomeRemoteDataSourceImpl({@required this.apiHelper});

  @override
  Future<HomeModel> getHomeData() async {
    bool result = await apiHelper.isNetworkConnected();

    if (!result) {
      throw NetworkNotAvaliableException();
    }

    try {
      await Future.delayed(Duration(seconds: 2));
      return HomeModel.fromJson({
        "offeredRestaurants": [
          {
            "query": "offerable?city_id=2",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "query": "offerable?city_id=2",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "query": "offerable?city_id=2",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "query": "1",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          }
        ],
        "bestRestaurants": [
          {
            "query": "1",
            "name": "BB",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "query": "1",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "query": "1",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "query": "1",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          }
        ],
        "categories": [
          {
            "query": "1",
            "name": "XX",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "query": "1",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "query": "1",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "query": "1",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          }
        ]
      });
      //TODO
      // Response response = await Dio().get(
      //   apiHelper.appendPath(path: "lose"),
      //   options: await apiHelper.getHeaders(withToken: false),
      // );

      // return HomeModel.fromJson(await response.data);
    } catch (e) {
      throw UnExpectedException();
    }
  }

  @override
  Future<List<VendorModel>> getVendors({@required String query}) async {
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
