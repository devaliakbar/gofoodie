import 'package:flutter/material.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/order/presentation/widgets/my_orders/current_order_tab/current_order_tab.dart';
import 'package:gofoodie/features/order/presentation/widgets/my_orders/my_orders_appbar.dart';

class MyOrders extends StatelessWidget {
  static const String routeName = '/my_orders';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: MyOrdersAppbar(),
        body: SafeArea(
          child: TabBarView(
            children: [
              Tab(
                child: CurrentOrderTab(),
              ),
              Tab(
                child: NormalText("Ali"),
              ),
              Tab(
                child: NormalText("Ali"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
