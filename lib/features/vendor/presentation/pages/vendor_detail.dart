import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/services/show_toast.dart';
import 'package:gofoodie/core/widgets/loading_view.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/vendor_details/vendor_details_bloc.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/vendor_online_order/vendor_online_order_bloc.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_detail/vendor_body.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_detail/vendor_header/vendor_header.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendor_detail/vendor_tabs.dart';

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
  void initState() {
    super.initState();

    BlocProvider.of<VendorDetailsBloc>(context).add(
      GetVendorDetailsEvent(vendorId: widget.vendorId),
    );

    BlocProvider.of<VendorOnlineOrderBloc>(context, listen: false).add(
      GetVendorProductsEvent(categoryId: null),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<VendorDetailsBloc, VendorDetailsState>(
        listener: (BuildContext context, state) {
          print("VendorDetails Screen State Changed");

          if (state is VendorDetailsErrorState) {
            ShowToast(state.message);
          }
        },
        builder: (BuildContext context, state) {
          if (state is VendorDetailsLoadedState) {
            return Column(
              children: [
                VendorHeader(
                  vendorInfo: state.vendorDetailsEntity.vendorInfo,
                ),
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
                        child: VendorBody(
                          selectedTab: selectedTab,
                          vendorId: widget.vendorId,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                )
              ],
            );
          }

          return Center(
            child: LoadingView(),
          );
        },
      ),
    );
  }
}
