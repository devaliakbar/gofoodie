import 'package:flutter/material.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/utils/utils.dart';
import 'package:gofoodie/core/widgets/custom_button.dart';
import 'package:gofoodie/core/widgets/custom_text_field.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class VendorBookTable extends StatefulWidget {
  @override
  _VendorBookTableState createState() => _VendorBookTableState();
}

class _VendorBookTableState extends State<VendorBookTable> {
  DateTime selectedDate = DateTime.now();

  final TextEditingController numberOfGuestController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    dateController.text = Utils.getFormattedDate(selectedDate);
  }

  @override
  void dispose() {
    numberOfGuestController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dateController.dispose();

    super.dispose();
  }

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
              controller: numberOfGuestController,
            ),
            SizedBox(
              height: SizeConfig.height(2),
            ),
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: CustomTextField(
                label: "Date Of Booking",
                inputType: TextInputType.datetime,
                borderRadius: SizeConfig.width(2),
                controller: dateController,
                enabled: false,
              ),
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
              controller: nameController,
            ),
            SizedBox(
              height: SizeConfig.height(2),
            ),
            CustomTextField(
              label: "Email",
              inputType: TextInputType.emailAddress,
              borderRadius: SizeConfig.width(2),
              controller: emailController,
            ),
            SizedBox(
              height: SizeConfig.height(2),
            ),
            CustomTextField(
              label: "Phone",
              inputType: TextInputType.phone,
              borderRadius: SizeConfig.width(2),
              controller: phoneController,
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

  Future<void> _selectDate(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateController.text = Utils.getFormattedDate(selectedDate);
    }
  }
}
