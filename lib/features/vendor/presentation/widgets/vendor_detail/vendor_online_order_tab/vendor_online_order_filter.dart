import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/loading_view.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/vendor_details/vendor_details_bloc.dart';

class VendorOnlineOrderFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorDetailsBloc, VendorDetailsState>(
      builder: (BuildContext context, state) {
        if (state is VendorDetailsLoadedState) {
          return ListView.builder(
            itemCount: state.vendorDetailsEntity.vendorCategories.length + 1,
            padding: EdgeInsets.only(
              top: SizeConfig.height(2),
            ),
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.width(1),
                    ),
                    child: NormalText(
                      "All",
                      color: AppColors.red,
                      size: FontSizes.fontSizeS,
                    ),
                  ),
                );
              }

              return InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.width(1),
                  ),
                  child: NormalText(
                    state.vendorDetailsEntity.vendorCategories[index - 1].name,
                    size: FontSizes.fontSizeS,
                  ),
                ),
              );
            },
          );
        }
        return Center(
          child: LoadingView(),
        );
      },
    );
  }
}
