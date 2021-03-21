import 'package:flutter/material.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_body.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_header/vendor_header.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_tabs.dart';

class VendorDetail extends StatefulWidget {
  static const String routeName = '/vendor_detail';

  final int vendorId;
  VendorDetail({@required this.vendorId});

  @override
  _VendorDetailState createState() => _VendorDetailState();
}

class _VendorDetailState extends State<VendorDetail> {
  int selectedTab = VendorTabs.TAB_ONLINE_ORDER;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          VendorHeader(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VendorTabs(
                  selectedTab: selectedTab,
                  onVendorTabSelect: (int mSelectedTab) {
                    setState(() {
                      selectedTab = mSelectedTab;
                    });
                  },
                ),
                Expanded(
                  child: VendorBody(selectedTab: selectedTab),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}
