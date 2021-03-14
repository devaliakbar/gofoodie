import 'package:flutter/material.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_online_order_tab/vendor_online_order_tab.dart';

class VendorBody extends StatelessWidget {
  final int selectedTab;
  VendorBody({@required this.selectedTab});

  @override
  Widget build(BuildContext context) {
    switch (selectedTab) {
      default:
        return VendorOnlineOrderTab();
    }
  }
}
