import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/show_toast.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/core/widgets/tapped.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatelessWidget {
  static const String routeName = '/location_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.black),
        title: NormalText(
          "Location",
          color: AppColors.black,
          boldText: true,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            SizeConfig.width(5),
          ),
          child: Column(
            children: [
              Tapped(
                onTap: () async {
                  Prediction _ = await PlacesAutocomplete.show(
                    context: context,
                    apiKey: "",
                    mode: Mode.overlay,
                    language: "en",
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: SizeConfig.height(6.5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NormalText(
                        "Search Location",
                        color: AppColors.black,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        padding: EdgeInsets.all(SizeConfig.height(1)),
                        child: Icon(
                          Icons.location_pin,
                          size: IconSizes.iconSizeM,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.height(3),
              ),
              Tapped(
                onTap: _determinePosition,
                child: Row(
                  children: [
                    Icon(
                      Icons.location_searching_rounded,
                      color: AppColors.red,
                      size: IconSizes.iconSizeM,
                    ),
                    SizedBox(
                      width: SizeConfig.width(3),
                    ),
                    NormalText(
                      "Use my current location",
                      color: AppColors.red,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return ShowToast('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return ShowToast('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return ShowToast(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    print(await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high));
  }
}
