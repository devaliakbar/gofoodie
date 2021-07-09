import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/order/presentation/blocs/cart/cart_bloc.dart';

class DeliveryModeSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.account_balance_outlined,
          color: AppColors.green,
          size: IconSizes.iconSizeM,
        ),
        SizedBox(
          width: SizeConfig.width(5),
        ),
        NormalText(
          "Pick Up",
          color: AppColors.black,
          size: FontSizes.fontSizeS,
          boldText: true,
        ),
        SizedBox(
          width: SizeConfig.width(3),
        ),
        GestureDetector(
          onTap: () {
            BlocProvider.of<CartBloc>(context).add(
              TogglePickUpEvent(),
            );
          },
          child: BlocBuilder<CartBloc, CartState>(
            builder: (BuildContext context, CartState cartState) {
              if (cartState is CartLoadedState) {
                return Container(
                  width: SizeConfig.height(5),
                  height: SizeConfig.height(2.1),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: cartState.cart.doesUserPickUp
                          ? AppColors.black
                          : AppColors.red,
                      width: SizeConfig.height(0.25),
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Container(
                    alignment: cartState.cart.doesUserPickUp
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.height(0.5)),
                      width: SizeConfig.height(1),
                      height: SizeConfig.height(1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: cartState.cart.doesUserPickUp
                            ? AppColors.black
                            : AppColors.red,
                      ),
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
        SizedBox(
          width: SizeConfig.width(3),
        ),
        NormalText(
          "Delivery",
          color: AppColors.red,
          size: FontSizes.fontSizeS,
          boldText: true,
        ),
      ],
    );
  }
}
