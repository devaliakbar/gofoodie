import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/core/widgets/quantity_button.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_online_order_tab/vendor_online_order_basket/vendor_online_order_basket_button.dart';

class VendorOnlineOrderBasket {
  VendorOnlineOrderBasket(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            SizeConfig.width(5),
          ),
          topRight: Radius.circular(
            SizeConfig.width(5),
          ),
        ),
      ),
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.all(
            SizeConfig.width(5),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      color: AppColors.green,
                    ),
                    SizedBox(
                      width: SizeConfig.width(5),
                    ),
                    NormalText(
                      "Delivery in 43 mins",
                      color: AppColors.black,
                      size: FontSizes.fontSizeS,
                    )
                  ],
                ),
                Divider(),
                SizedBox(
                  height: SizeConfig.height(0.5),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      _buildItems(),
                      _buildItems(),
                    ],
                  ),
                ),
                VendorOnlineOrderBasketButton()
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildItems() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: SizeConfig.height(2.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NormalText(
                  "Bucket Offer [10 Pieces]",
                  color: AppColors.black,
                ),
                NormalText(
                  "₹650",
                  size: FontSizes.fontSizeM,
                  color: AppColors.black,
                )
              ],
            ),
          ),
          SizedBox(
            width: SizeConfig.width(5),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              QuantityButton(),
              SizedBox(
                height: SizeConfig.height(0.5),
              ),
              NormalText(
                "₹650",
                size: FontSizes.fontSizeM,
                color: AppColors.black,
              )
            ],
          )
        ],
      ),
    );
  }
}
