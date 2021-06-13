import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/order/presentation/blocs/cart/cart_bloc.dart';
import 'package:gofoodie/features/order/presentation/widgets/order_basket/order_basket.dart';

class OrderBasketBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (BuildContext context, CartState cartState) {
        if (cartState is CartLoadedState) {
          return Container(
            margin: EdgeInsets.all(
              SizeConfig.width(5),
            ),
            height: SizeConfig.height(7.5),
            child: Material(
              color: AppColors.red,
              borderRadius: BorderRadius.circular(
                SizeConfig.height(1),
              ),
              child: InkWell(
                onTap: () => OrderBasket(context),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.height(1),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.red.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(
                    SizeConfig.height(1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NormalText(
                            "${cartState.cart.totalItems} ITEMS",
                            color: Colors.white,
                            size: FontSizes.fontSizeS,
                          ),
                          Row(
                            children: [
                              NormalText(
                                "₹${cartState.cart.totalAmount}",
                                color: Colors.white,
                              ),
                              NormalText(
                                " plux taxes",
                                color: Colors.white,
                                size: FontSizes.fontSizeS,
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          NormalText(
                            "View Cart",
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: IconSizes.iconSizeXXS,
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
