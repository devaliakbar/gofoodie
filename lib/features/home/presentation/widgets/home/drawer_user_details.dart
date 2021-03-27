import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/image_from_network.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class DrawerUserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.heightWithoutSafeArea(18),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.drawer), fit: BoxFit.cover),
      ),
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: SizeConfig.height(1),
              ),
              width: SizeConfig.height(6),
              height: SizeConfig.height(6),
              child: ClipOval(
                child: ImageFromNetwork(
                  imageUrl:
                      "https://i.pinimg.com/originals/7d/ea/2d/7dea2dbab4e77fc02764f092599fd10c.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            NormalText(
              "Ali Akbar",
              color: Colors.white,
            ),
            NormalText(
              "ali@email.com",
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
