import 'package:flutter/material.dart';
import 'package:gofoodie/features/order/presentation/widgets/my_orders/current_order_tab/current_order_tab.dart';
import 'package:gofoodie/features/order/presentation/widgets/my_orders/monthly_order_tab/monthly_order_tab.dart';
import 'package:gofoodie/features/order/presentation/widgets/my_orders/my_orders_appbar.dart';
import 'package:gofoodie/features/order/presentation/widgets/my_orders/order_history_tab/order_history_tab.dart';

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
                child: OrderHistoryTab(),
              ),
              Tab(
                child: MonthlyOrderTab(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
