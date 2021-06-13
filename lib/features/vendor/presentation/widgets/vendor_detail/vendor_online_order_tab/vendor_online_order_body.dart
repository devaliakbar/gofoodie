import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/show_toast.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/utils/utils.dart';
import 'package:gofoodie/core/widgets/dashed_line.dart';
import 'package:gofoodie/core/widgets/image_from_network.dart';
import 'package:gofoodie/core/widgets/loading_view.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/core/widgets/quantity_button.dart';
import 'package:gofoodie/features/vendor/domain/entities/vendor_product.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/vendor_online_order/vendor_online_order_bloc.dart';

class VendorOnlineOrderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorOnlineOrderBloc, VendorOnlineOrderState>(
      builder: (BuildContext context, VendorOnlineOrderState state) {
        if (state is VendorProductsLoadedState) {
          return ListView.separated(
            itemCount: state.products.length,
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: SizeConfig.height(2)),
                child: DottedLine(
                  direction: Axis.horizontal,
                  dashColor: AppColors.lightBlack.withOpacity(0.3),
                  dashGapLength: SizeConfig.width(2),
                  dashLength: SizeConfig.width(2),
                ),
              );
            },
            padding: EdgeInsets.only(top: SizeConfig.height(3)),
            itemBuilder: (BuildContext context, int index) {
              VendorProduct product = state.products[index];

              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: SizeConfig.height(2),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: SizeConfig.height(11),
                            padding: EdgeInsets.only(
                              left: SizeConfig.width(2),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NormalText(
                                  product.name,
                                  size: FontSizes.fontSizeBSM,
                                  color: AppColors.black,
                                  truncate: true,
                                ),
                                NormalText(
                                  Utils.getCurrencyFormat(product.price),
                                  size: FontSizes.fontSizeBSM,
                                  color: AppColors.black,
                                  truncate: true,
                                  boldText: true,
                                ),
                                NormalText(
                                  product.description,
                                  size: FontSizes.fontSizeXS,
                                  color: AppColors.black,
                                  truncate: true,
                                  maxLine: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: SizeConfig.height(11),
                          width: SizeConfig.height(11),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(SizeConfig.height(2)),
                            child: ImageFromNetwork(
                              imageUrl: product.imageUrl,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: SizeConfig.height(0.4),
                    bottom: 0,
                    child: QuantityButton(),
                  )
                ],
              );
            },
          );
        }

        if (state is VendorProductsLoadingFailedState) {
          ShowToast(state.message);
        }

        return Center(
          child: LoadingView(),
        );
      },
    );
  }
}
