import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/show_toast.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_button.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/location/domain/entities/location_model.dart';
import 'package:gofoodie/features/location/presentation/blocs/bloc/location_bloc.dart';
import 'package:gofoodie/features/order/presentation/blocs/cart/cart_bloc.dart';
import 'package:gofoodie/features/order/presentation/pages/payment_method.dart';
import 'package:gofoodie/features/order/presentation/widgets/checkout/coupon_apply.dart';
import 'package:gofoodie/features/profile/presentation/blocs/profile/profile_bloc.dart';

class AmountDetails extends StatelessWidget {
  final TextEditingController deliveryNoteEditingController;

  AmountDetails({@required this.deliveryNoteEditingController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (BuildContext context, CartState cartState) {
        if (cartState is CartLoadedState) {
          return Container(
            margin: EdgeInsets.only(
              top: SizeConfig.height(1),
            ),
            padding: EdgeInsets.all(
              SizeConfig.width(3),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: AppColors.lightGrey,
                  width: SizeConfig.height(0.3),
                ),
              ),
            ),
            child: Column(
              children: [
                CouponApply(),
                SizedBox(
                  height: SizeConfig.height(2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalText(
                      "SubTotal",
                      color: AppColors.black,
                    ),
                    NormalText("AED ${cartState.cart.totalAmount}",
                        color: AppColors.black),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         NormalText(
                //           "Coupon Offer",
                //           color: AppColors.red,
                //         ),
                //         Tapped(
                //           child: Container(
                //             margin: EdgeInsets.only(
                //               left: SizeConfig.width(1),
                //             ),
                //             padding: EdgeInsets.all(
                //               SizeConfig.width(0.2),
                //             ),
                //             decoration: BoxDecoration(
                //                 shape: BoxShape.circle, color: AppColors.red),
                //             child: Icon(
                //               Icons.close,
                //               color: Colors.white,
                //               size: FontSizes.fontSizeS,
                //             ),
                //           ),
                //         )
                //       ],
                //     ),
                //     NormalText("- ₹10.00", color: AppColors.red),
                //   ],
                // ),
                cartState.cart.doesUserPickUp
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NormalText(
                            "Delivery Charge",
                          ),
                          NormalText(
                            "AED 5.0",
                          ),
                        ],
                      ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     NormalText(
                //       "Taxes",
                //     ),
                //     NormalText(
                //       "26.00",
                //     ),
                //   ],
                // ),
                Divider(
                  thickness: SizeConfig.height(0.2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalText(
                      "Total",
                      color: AppColors.black,
                      boldText: true,
                    ),
                    NormalText(
                      "AED ${cartState.cart.doesUserPickUp ? cartState.cart.totalAmount : cartState.cart.totalAmount + 5}",
                      color: AppColors.black,
                      boldText: true,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.height(2),
                ),
                CustomButton(
                  onClick: () {
                    if (cartState.cart.phone == null) {
                      return ShowToast("Please enter phone");
                    }

                    if (deliveryNoteEditingController.text.trim() == "") {
                      cartState.cart.note = null;
                    } else {
                      cartState.cart.note =
                          deliveryNoteEditingController.text.trim();
                    }

                    final LocationState locationState =
                        BlocProvider.of<LocationBloc>(context).state;

                    LocationModel locationModel;

                    if (locationState is LocationLoadedState) {
                      locationModel = locationState.location;
                    } else {
                      return ShowToast("Select Location");
                    }

                    final ProfileState profileState =
                        BlocProvider.of<ProfileBloc>(context).state;

                    String userName;

                    if (profileState is ProfileLoadedState) {
                      userName = profileState.profileData.name;
                    } else {
                      return ShowToast("Failed to get user name");
                    }

                    final List<Map<String, dynamic>> products = [];
                    cartState.cart.products.forEach((element) {
                      products.add({
                        'product_id': element.id,
                        'qty': element.qty,
                        'price': element.price
                      });
                    });

                    final Map<String, dynamic> form = {
                      "vendor_id": cartState.cart.vendorId,
                      "order_type": 1,
                      "payment_method": "cod",
                      "payment_status": 0,
                      "total": cartState.cart.totalAmount,
                      "shipping": cartState.cart.doesUserPickUp ? 0 : 5,
                      "commission": 0,
                      "discount": 0,
                      "status": 2,
                      "name": userName,
                      "phone": cartState.cart.phone,
                      "delivery_address": locationModel.locationName,
                      "latitude": locationModel.latitude,
                      "longitude": locationModel.longitude,
                      "order_note": cartState.cart.note ?? "",
                      "datacart": products
                    };
                    Navigator.pushNamed(context, PaymentMethod.routeName,
                        arguments: form);
                  },
                  title: "Select Payment Method",
                  width: double.infinity,
                  borderRadius: SizeConfig.width(2),
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
