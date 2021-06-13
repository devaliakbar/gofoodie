import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/loading_view.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/vendor_details/vendor_details_bloc.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/vendor_online_order/vendor_online_order_bloc.dart';

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
            itemBuilder: (BuildContext context, int index) =>
                _buildFilter(context, index, state),
          );
        }
        return Center(
          child: LoadingView(),
        );
      },
    );
  }

  Widget _buildFilter(
      BuildContext context, int index, VendorDetailsLoadedState state) {
    int categoryId = context.watch<VendorOnlineOrderBloc>().categoryId;

    if (index == 0) {
      bool isSelected = categoryId == null;
      return InkWell(
        onTap: () {
          BlocProvider.of<VendorOnlineOrderBloc>(context, listen: false).add(
            GetVendorProductsEvent(categoryId: null),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.width(1),
          ),
          child: NormalText(
            "All",
            color: isSelected ? AppColors.red : AppColors.lightBlack,
            size: FontSizes.fontSizeS,
          ),
        ),
      );
    }

    bool isSelected =
        categoryId == state.vendorDetailsEntity.vendorCategories[index - 1].id;

    return InkWell(
      onTap: () {
        BlocProvider.of<VendorOnlineOrderBloc>(context, listen: false).add(
          GetVendorProductsEvent(
              categoryId:
                  state.vendorDetailsEntity.vendorCategories[index - 1].id),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.width(1),
        ),
        child: NormalText(
          state.vendorDetailsEntity.vendorCategories[index - 1].name,
          size: FontSizes.fontSizeS,
          color: isSelected ? AppColors.red : AppColors.lightBlack,
        ),
      ),
    );
  }
}
