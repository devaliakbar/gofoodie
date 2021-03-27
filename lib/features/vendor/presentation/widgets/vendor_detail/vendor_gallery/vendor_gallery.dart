import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/image_from_network.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class VendorGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.width(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NormalText(
            "Vendor Gallery",
            boldText: true,
          ),
          SizedBox(
            height: SizeConfig.height(1),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 16,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(
                    SizeConfig.width(3),
                  ),
                  child: ImageFromNetwork(
                    imageUrl:
                        "https://i.pinimg.com/originals/c2/ee/f7/c2eef71d12610291ada1e8a87878feba.jpg",
                    fit: BoxFit.fitWidth,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
