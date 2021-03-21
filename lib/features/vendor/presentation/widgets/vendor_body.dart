import 'package:flutter/material.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_book_table/vendor_book_table.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_gallery/vendor_gallery.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_info_tab/vendor_info_tab.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_online_order_tab/vendor_online_order_tab.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_rating/vendor_rating.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_tabs.dart';

class VendorBody extends StatelessWidget {
  final int selectedTab;
  VendorBody({@required this.selectedTab});

  @override
  Widget build(BuildContext context) {
    switch (selectedTab) {
      case VendorTabs.TAB_INFO:
        return VendorInfoTab();
      case VendorTabs.TAB_GALLERY:
        return VendorGallery();
      case VendorTabs.TAB_BOOKING:
        return VendorBookTable();
      case VendorTabs.TAB_RATING:
        return VendorRating();
      default:
        return VendorOnlineOrderTab();
    }
  }
}
