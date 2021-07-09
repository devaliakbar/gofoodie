import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/order/presentation/blocs/cart/cart_bloc.dart';

class OrderContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
          left: SizeConfig.width(2), right: SizeConfig.width(2)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          SizeConfig.width(3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NormalText(
              "Your Order",
              color: AppColors.black,
              boldText: true,
            ),
            Divider(),
            BlocBuilder<CartBloc, CartState>(
              builder: (BuildContext context, CartState cartState) {
                if (cartState is CartLoadedState) {
                  return Column(
                    children: [
                      for (int index = 0;
                          index < cartState.cart.products.length;
                          index++)
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      NormalText(
                                        cartState.cart.products[index].name,
                                        color: AppColors.black,
                                      ),
                                      NormalText(
                                        "${cartState.cart.products[index].qty}  *  AED ${cartState.cart.products[index].price}",
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: SizeConfig.width(3),
                                ),
                                NormalText(
                                  "AED ${cartState.cart.products[index].price * cartState.cart.products[index].qty}",
                                  boldText: true,
                                )
                              ],
                            ),
                            if (index < cartState.cart.products.length - 1)
                              Divider(),
                          ],
                        )
                    ],
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
