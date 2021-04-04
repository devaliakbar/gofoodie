import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/image_from_network.dart';
import 'package:gofoodie/core/widgets/loading_view.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/vendor_details/vendor_details_bloc.dart';

class VendorGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorDetailsBloc, VendorDetailsState>(
      builder: (BuildContext context, state) {
        if (state is VendorDetailsLoadedState) {
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
                    itemCount: state.vendorDetailsEntity.gallery.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.width(3),
                        ),
                        child: ImageFromNetwork(
                          imageUrl: state.vendorDetailsEntity.gallery[index],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }
        return Center(
          child: LoadingView(),
        );
      },
    );
  }
}
