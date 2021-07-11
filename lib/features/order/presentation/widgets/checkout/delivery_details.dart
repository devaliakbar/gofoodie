import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/show_toast.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_text_field.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/core/widgets/tapped.dart';
import 'package:gofoodie/features/location/presentation/blocs/bloc/location_bloc.dart';
import 'package:gofoodie/features/location/presentation/pages/location_page.dart';
import 'package:gofoodie/features/order/presentation/blocs/cart/cart_bloc.dart';
import 'package:gofoodie/features/order/presentation/widgets/checkout/edit_phone_number_dialogue.dart';
import 'package:gofoodie/features/profile/presentation/blocs/profile/profile_bloc.dart';

class DeliveryDetails extends StatefulWidget {
  final TextEditingController deliveryNoteEditingController;

  DeliveryDetails({@required this.deliveryNoteEditingController});

  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  @override
  void dispose() {
    widget.deliveryNoteEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.height(1),
        horizontal: SizeConfig.width(2),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          SizeConfig.width(3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NormalText(
              "Personal Details",
              color: AppColors.black,
              boldText: true,
            ),
            BlocConsumer<ProfileBloc, ProfileState>(
              listener: (context, state) {
                print("Profile Screen State Changed");

                if (state is ProfileErrorState) {
                  ShowToast(state.message);
                }
              },
              builder: (context, state) {
                String userName = "Loading...";
                if (state is ProfileLoadedState) {
                  userName = state.profileData.name;
                } else if (state is ProfileInitialState) {
                  BlocProvider.of<ProfileBloc>(context).add(
                    ProfileLoadEvent(),
                  );
                }

                return NormalText(
                  userName,
                  color: AppColors.black,
                );
              },
            ),
            BlocBuilder<CartBloc, CartState>(
              builder: (BuildContext context, CartState cartState) {
                if (cartState is CartLoadedState) {
                  return cartState.cart.phone != null
                      ? Row(
                          children: [
                            NormalText(
                              cartState.cart.phone,
                              color: AppColors.black,
                            ),
                            SizedBox(
                              width: SizeConfig.width(1),
                            ),
                            Tapped(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  child: EditPhoneNumberDialogue(
                                    phone: cartState.cart.phone,
                                  ),
                                );
                              },
                              child: NormalText(
                                "(Edit)",
                                color: AppColors.red,
                                size: FontSizes.fontSizeXS,
                              ),
                            )
                          ],
                        )
                      : Tapped(
                          onTap: () {
                            showDialog(
                              context: context,
                              child: EditPhoneNumberDialogue(
                                phone: null,
                              ),
                            );
                          },
                          child: NormalText(
                            "Add Phone",
                            color: AppColors.red,
                          ),
                        );
                }

                return Container();
              },
            ),
            SizedBox(
              height: SizeConfig.height(1),
            ),
            Row(
              children: [
                NormalText(
                  "Delivery Address",
                  color: AppColors.black,
                  boldText: true,
                ),
                SizedBox(
                  width: SizeConfig.width(1),
                ),
                Tapped(
                  onTap: () {
                    Navigator.pushNamed(context, LocationPage.routeName);
                  },
                  child: NormalText(
                    "(Edit)",
                    color: AppColors.red,
                    size: FontSizes.fontSizeXS,
                  ),
                )
              ],
            ),
            BlocBuilder<LocationBloc, LocationState>(
              builder: (context, state) {
                String location = "Loading...";
                if (state is LocationLoadedState) {
                  location = state.location.locationName;
                }

                return NormalText(
                  location,
                  color: AppColors.black,
                  truncate: true,
                );
              },
            ),
            SizedBox(
              height: SizeConfig.height(1),
            ),
            NormalText(
              "Landmark / Order Notes",
              color: AppColors.black,
              boldText: true,
            ),
            SizedBox(
              height: SizeConfig.height(1),
            ),
            CustomTextField(
              controller: widget.deliveryNoteEditingController,
              borderRadius: SizeConfig.width(2),
              maxLine: 3,
            )
          ],
        ),
      ),
    );
  }
}
