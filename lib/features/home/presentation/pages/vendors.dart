import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/show_toast.dart';
import 'package:gofoodie/core/widgets/image_from_network.dart';
import 'package:gofoodie/core/widgets/loading_view.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/home/presentation/blocs/vendors/vendors_bloc.dart';
import 'package:gofoodie/features/home/presentation/widgets/vendors/vendors_appbar.dart';

class Vendors extends StatelessWidget {
  static const String routeName = '/vendors';

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<VendorsBloc>(context).add(
      GetVendorsEvent(query: "Jso"),
    );

    return Scaffold(
      appBar: VendorsAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15, right: 15, bottom: 10),
          child: BlocConsumer<VendorsBloc, VendorsState>(
            listener: (context, state) {
              print("Home Screen State Changed");

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
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 15),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: ImageFromNetwork(
                                imageUrl:
                                    "https://media-cdn.tripadvisor.com/media/photo-s/05/18/4f/1e/getlstd-property-photo.jpg",
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: NormalText(
                              "Marshall",
                              color: AppColors.black,
                            ),
                          )
                        ],
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
