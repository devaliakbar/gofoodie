import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/order/presentation/widgets/checkout/amount_details.dart';
import 'package:gofoodie/features/order/presentation/widgets/checkout/delivery_details.dart';
import 'package:gofoodie/features/order/presentation/widgets/checkout/order_content.dart';

class CheckOutPage extends StatelessWidget {
  static const String routeName = '/check_out_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.black),
        title: NormalText(
          "Checkout",
          color: AppColors.black,
          boldText: true,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        DeliveryDetails(),
                        OrderContent(),
                      ],
                    ),
                  ),
                ),
                AmountDetails(),
              ],
            ),
            // Container(
            //   color: Colors.white.withOpacity(0.6),
            //   child: Center(
            //     child: CircularProgressIndicator(),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
