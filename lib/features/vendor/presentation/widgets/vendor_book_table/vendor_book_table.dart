import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_button.dart';
import 'package:gofoodie/core/widgets/custom_text_field.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class VendorBookTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.width(5),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NormalText(
              "Booking Information",
              boldText: true,
            ),
            SizedBox(
              height: SizeConfig.height(3),
            ),
            CustomTextField(
              label: "Number of Guests",
              inputType: TextInputType.number,
              borderRadius: SizeConfig.width(2),
            ),
            SizedBox(
              height: SizeConfig.height(2),
            ),
            CustomTextField(
              label: "Date Of Booking",
              inputType: TextInputType.datetime,
              borderRadius: SizeConfig.width(2),
            ),
            SizedBox(
              height: SizeConfig.height(3),
            ),
            NormalText(
              "Contact Information",
              boldText: true,
            ),
            SizedBox(
              height: SizeConfig.height(3),
            ),
            CustomTextField(
              label: "Name",
              inputType: TextInputType.name,
              borderRadius: SizeConfig.width(2),
            ),
            SizedBox(
              height: SizeConfig.height(2),
            ),
            CustomTextField(
              label: "Email",
              inputType: TextInputType.emailAddress,
              borderRadius: SizeConfig.width(2),
            ),
            SizedBox(
              height: SizeConfig.height(2),
            ),
            CustomTextField(
              label: "Phone",
              inputType: TextInputType.phone,
              borderRadius: SizeConfig.width(2),
            ),
            SizedBox(
              height: SizeConfig.height(2),
            ),
            CustomTextField(
              label: "Your Instructions",
              maxLine: 3,
              borderRadius: SizeConfig.width(2),
            ),
            SizedBox(
              height: SizeConfig.height(3),
            ),
            CustomButton(
              onClick: () {},
              title: "Book Now",
              width: double.infinity,
            ),
            SizedBox(
              height: SizeConfig.height(2),
            ),
          ],
        ),
      ),
    );
  }
}
