import 'package:flutter/material.dart';
import 'package:gofoodie/core/error/exceptions.dart';
import 'package:gofoodie/core/services/network/api_helper.dart';
import 'package:gofoodie/features/home/data/models/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> getHomeData();
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
            "id": "1",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "id": "1",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "id": "1",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "id": "1",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          }
        ],
        "bestRestaurants": [
          {
            "id": "1",
            "name": "BB",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "id": "1",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "id": "1",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "id": "1",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          }
        ],
        "categories": [
          {
            "id": "1",
            "name": "XX",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "id": "1",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "id": "1",
            "name": "AA",
            "imageUrl":
                "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg"
          },
          {
            "id": "1",
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
}
