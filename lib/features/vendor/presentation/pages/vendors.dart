import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/show_toast.dart';
import 'package:gofoodie/core/widgets/image_from_network.dart';
import 'package:gofoodie/core/widgets/loading_view.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/vendors/vendors_bloc.dart';
import 'package:gofoodie/features/vendor/presentation/pages/vendor_detail.dart';
import 'package:gofoodie/features/vendor/presentation/widgets/vendors/vendors_appbar.dart';

class Vendors extends StatelessWidget {
  static const String routeName = '/vendors';

  final int categoryId;
  Vendors({@required this.categoryId});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<VendorsBloc>(context).add(
      GetVendorsEvent(categoryId: categoryId),
    );

    return Scaffold(
      appBar: VendorsAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15, right: 15, bottom: 10),
          child: BlocConsumer<VendorsBloc, VendorsState>(
            listener: (context, state) {
              print("Vendors Screen State Changed");

              if (state is VendorsErrorState) {
                ShowToast(state.message);
              }
            },
            buildWhen: (previous, current) {
              if (current is VendorsErrorState) {
                return false;
              }

              return true;
            },
            builder: (context, state) {
              if (state is VendorsLoadedState) {
                return GridView.builder(
                  itemCount: state.vendors.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 15),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, VendorDetail.routeName,
                              arguments: state.vendors[index].id);
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: ImageFromNetwork(
                                  imageUrl: state.vendors[index].imageUrl,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: NormalText(
                                state.vendors[index].name,
                                color: AppColors.black,
                              ),
                            )
                          ],
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
          ),
        ),
      ),
    );
  }
}
