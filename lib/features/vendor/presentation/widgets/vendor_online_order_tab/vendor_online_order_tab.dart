import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_online_order_tab/vendor_online_order_body.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_online_order_tab/vendor_online_order_filter.dart';

class VendorOnlineOrderTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width(5),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: VendorOnlineOrderFilter(),
          ),
          Container(
            color: AppColors.lightBlack.withOpacity(0.12),
            width: 1,
          ),
          Expanded(
            flex: 8,
            child: VendorOnlineOrderBody(),
          )
        ],
      ),
    );
  }
}
