import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/core/widgets/success_dialogue.dart';
import 'package:gofoodie/features/home/presentation/pages/home.dart';

class PaymentMethod extends StatelessWidget {
  static const String routeName = '/payment_method';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.black),
        title: NormalText(
          "Select Payment Method",
          color: AppColors.black,
          boldText: true,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.width(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NormalText("SELECT A MODE TO PAY ₹25.00"),
              Card(
                margin: EdgeInsets.only(
                  top: SizeConfig.height(2),
                ),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    SizeConfig.width(1),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => SuccessDialogue(),
                    ).then((value) => Navigator.of(context)
                        .pushNamedAndRemoveUntil(
                            Home.routeName, (Route<dynamic> route) => false));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(
                      SizeConfig.width(5),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.home_work_outlined,
                          size: IconSizes.iconSizeL,
                          color: AppColors.lightBlack,
                        ),
                        SizedBox(
                          width: SizeConfig.width(5),
                        ),
                        NormalText(
                          "Cash On Delivery",
                          color: AppColors.black,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
