import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

typedef void OnVendorTabSelect(int mSelectedTab);

class VendorTabs extends StatelessWidget {
  static const int TAB_ONLINE_ORDER = 0;
  static const int TAB_GALLERY = 1;
  static const int TAB_INFO = 2;
  static const int TAB_BOOKING = 3;
  static const int TAB_RATING = 4;

  final int selectedTab;
  final OnVendorTabSelect onVendorTabSelect;

  VendorTabs({@required this.selectedTab, @required this.onVendorTabSelect});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          SizedBox(
            width: SizeConfig.width(5),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTab(
                      tabName: 'Online Order',
                      isSelected: selectedTab == VendorTabs.TAB_ONLINE_ORDER,
                      onSelect: () {
                        onVendorTabSelect(VendorTabs.TAB_ONLINE_ORDER);
                      }),
                  _buildTab(
                      tabName: 'Gallery',
                      isSelected: selectedTab == VendorTabs.TAB_GALLERY,
                      onSelect: () {
                        onVendorTabSelect(VendorTabs.TAB_GALLERY);
                      }),
                  _buildTab(
                      tabName: 'Info',
                      isSelected: selectedTab == VendorTabs.TAB_INFO,
                      onSelect: () {
                        onVendorTabSelect(VendorTabs.TAB_INFO);
                      }),
                  _buildTab(
                      tabName: 'Book A Table',
                      isSelected: selectedTab == VendorTabs.TAB_BOOKING,
                      onSelect: () {
                        onVendorTabSelect(VendorTabs.TAB_BOOKING);
                      }),
                  _buildTab(
                      tabName: 'Rating & Reviews',
                      isSelected: selectedTab == VendorTabs.TAB_RATING,
                      onSelect: () {
                        onVendorTabSelect(VendorTabs.TAB_RATING);
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTab({
    @required String tabName,
    @required onSelect,
    @required bool isSelected,
  }) {
    return InkWell(
      onTap: onSelect,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: isSelected ? 2 : 1,
              color: isSelected
                  ? AppColors.red
                  : AppColors.lightBlack.withOpacity(0.12),
            ),
          ),
        ),
        padding: EdgeInsets.only(
            left: SizeConfig.width(3),
            right: SizeConfig.width(3),
            top: SizeConfig.height(2),
            bottom: SizeConfig.height(2)),
        child: NormalText(
          tabName,
          color: AppColors.black,
          size: FontSizes.fontSizeBSM,
        ),
      ),
    );
  }
}
