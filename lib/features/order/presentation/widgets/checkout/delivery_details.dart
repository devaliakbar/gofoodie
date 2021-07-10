import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_text_field.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/core/widgets/tapped.dart';
import 'package:gofoodie/features/location/presentation/blocs/bloc/location_bloc.dart';
import 'package:gofoodie/features/location/presentation/pages/location_page.dart';

class DeliveryDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.height(1),
        horizontal: SizeConfig.width(2),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          SizeConfig.width(3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NormalText(
              "Personal Details",
              color: AppColors.black,
              boldText: true,
            ),
            NormalText(
              "Albert Einstein",
              color: AppColors.black,
            ),
            Row(
              children: [
                NormalText(
                  "+91 1234567890",
                  color: AppColors.black,
                ),
                SizedBox(
                  width: SizeConfig.width(1),
                ),
                Tapped(
                  child: NormalText(
                    "(Edit)",
                    color: AppColors.red,
                    size: FontSizes.fontSizeXS,
                  ),
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.height(1),
            ),
            Row(
              children: [
                NormalText(
                  "Delivery Address",
                  color: AppColors.black,
                  boldText: true,
                ),
                SizedBox(
                  width: SizeConfig.width(1),
                ),
                Tapped(
                  onTap: () {
                    Navigator.pushNamed(context, LocationPage.routeName);
                  },
                  child: NormalText(
                    "(Edit)",
                    color: AppColors.red,
                    size: FontSizes.fontSizeXS,
                  ),
                )
              ],
            ),
            BlocBuilder<LocationBloc, LocationState>(
              builder: (context, state) {
                String location = "Loading...";
                if (state is LocationLoadedState) {
                  location = state.location.locationName;
                }

                return NormalText(
                  location,
                  color: AppColors.black,
                  truncate: true,
                );
              },
            ),
            SizedBox(
              height: SizeConfig.height(1),
            ),
            NormalText(
              "Landmark / Order Notes",
              color: AppColors.black,
              boldText: true,
            ),
            SizedBox(
              height: SizeConfig.height(1),
            ),
            CustomTextField(
              borderRadius: SizeConfig.width(2),
              maxLine: 3,
            )
          ],
        ),
      ),
    );
  }
}
