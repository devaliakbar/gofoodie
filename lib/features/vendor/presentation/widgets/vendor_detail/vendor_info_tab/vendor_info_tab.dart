import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/loading_view.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/vendor_details/vendor_details_bloc.dart';

class VendorInfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorDetailsBloc, VendorDetailsState>(
      builder: (BuildContext context, state) {
        if (state is VendorDetailsLoadedState) {
          return Padding(
            padding: EdgeInsets.all(
              SizeConfig.width(5),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NormalText(
                    "Restaurant Info",
                    size: FontSizes.fontSizeL,
                    boldText: true,
                  ),
                  SizedBox(
                    height: SizeConfig.height(1),
                  ),
                  NormalText(state.vendorDetailsEntity.vendorInfo.description),
                  // SizedBox(
                  //   height: SizeConfig.height(1),
                  // ),
                  // NormalText(state.vendorDetailsEntity.vendorInfo.address),
                  // NormalText(state.vendorDetailsEntity.vendorInfo.addressLine),
                  SizedBox(
                    height: SizeConfig.height(1),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: AppColors.red,
                        size: IconSizes.iconSizeM,
                      ),
                      SizedBox(
                        width: SizeConfig.width(3),
                      ),
                      NormalText(
                        state.vendorDetailsEntity.vendorInfo.phone,
                        color: AppColors.black,
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.height(1),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: AppColors.red,
                        size: IconSizes.iconSizeM,
                      ),
                      SizedBox(
                        width: SizeConfig.width(3),
                      ),
                      NormalText(
                        state.vendorDetailsEntity.vendorInfo.email,
                        color: AppColors.black,
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.height(2),
                  ),
                  for (int timesIndex = 0;
                      timesIndex <
                          state.vendorDetailsEntity.vendorOpeningTimes.length;
                      timesIndex++)
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: SizeConfig.height(1),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time_sharp,
                            color: AppColors.red,
                            size: IconSizes.iconSizeM,
                          ),
                          SizedBox(
                            width: SizeConfig.width(1.5),
                          ),
                          NormalText(
                            state.vendorDetailsEntity
                                .vendorOpeningTimes[timesIndex].day
                                .toUpperCase(),
                            color: AppColors.black,
                            boldText: true,
                          ),
                          NormalText(
                            " " +
                                state.vendorDetailsEntity
                                    .vendorOpeningTimes[timesIndex].openTime,
                            color: AppColors.black,
                          ),
                          NormalText(
                            " - " +
                                state.vendorDetailsEntity
                                    .vendorOpeningTimes[timesIndex].closeTime,
                            color: AppColors.black,
                          )
                        ],
                      ),
                    )
                ],
              ),
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
