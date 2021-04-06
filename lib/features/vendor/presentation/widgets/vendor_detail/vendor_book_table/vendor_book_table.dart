import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/utils/utils.dart';
import 'package:gofoodie/core/widgets/custom_button.dart';
import 'package:gofoodie/core/widgets/custom_text_field.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/vendor/presentation/blocs/book_table/book_table_bloc.dart';

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

  final GlobalKey<FormState> _formKey = new GlobalKey();

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
        child: Form(
          key: _formKey,
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
                validator: onValidateGuest,
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
                validator: validateName,
              ),
              SizedBox(
                height: SizeConfig.height(2),
              ),
              CustomTextField(
                label: "Email",
                inputType: TextInputType.emailAddress,
                borderRadius: SizeConfig.width(2),
                controller: emailController,
                validator: onValidateEmail,
              ),
              SizedBox(
                height: SizeConfig.height(2),
              ),
              CustomTextField(
                label: "Phone",
                inputType: TextInputType.phone,
                borderRadius: SizeConfig.width(2),
                controller: phoneController,
                validator: onValidatePhone,
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
              BlocConsumer<BookTableBloc, BookTableState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return CustomButton(
                    onClick: onSave,
                    title: "Book Now",
                    width: double.infinity,
                    isLoading: state is BookTableLoadingState,
                  );
                },
              ),
              SizedBox(
                height: SizeConfig.height(2),
              ),
            ],
          ),
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

  String validateName(String value) {
    if (value.length == 0) {
      return "Please enter a name";
    }
    return null;
  }

  String onValidateEmail(String value) {
    if (value == "") {
      return AppString.fieldEmpty;
    }
    if (!Utils.isEmail(value)) {
      return AppString.enterValidEmail;
    }
    return null;
  }

  String onValidatePhone(String value) {
    if (value == "") {
      return AppString.fieldEmpty;
    }
    if (value.length < 10) {
      return "Please enter a valid phone number";
    }
    return null;
  }

  String onValidateGuest(String value) {
    if (value == "") {
      return AppString.fieldEmpty;
    }

    int number = int.parse(value);
    if (number < 1) {
      return "Please enter a valid number";
    }

    if (number > 100) {
      return "Maximum allowed guests is 100";
    }

    return null;
  }

  void onSave() {
    if (!_formKey.currentState.validate()) {
      return;
    }
  }
}
