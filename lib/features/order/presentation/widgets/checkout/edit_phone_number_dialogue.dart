import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/show_toast.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_button.dart';
import 'package:gofoodie/core/widgets/custom_text_field.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/order/presentation/blocs/cart/cart_bloc.dart';

class EditPhoneNumberDialogue extends StatefulWidget {
  final String phone;

  EditPhoneNumberDialogue({@required this.phone});

  @override
  _EditPhoneNumberDialogueState createState() =>
      _EditPhoneNumberDialogueState();
}

class _EditPhoneNumberDialogueState extends State<EditPhoneNumberDialogue> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneController.text = widget.phone ?? "";
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(
        top: SizeConfig.height(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: IntrinsicHeight(
          child: Container(
            width: SizeConfig.width(90),
            padding: EdgeInsets.all(15),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Material(
                color: Colors.white,
                child: Column(
                  children: [
                    NormalText(
                      widget.phone == null ? "Add Phone" : "Change phone",
                      color: AppColors.black,
                      boldText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      label: "Phone",
                      inputType: TextInputType.phone,
                      controller: phoneController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    _buildSaveButton(),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return CustomButton(
      onClick: () {
        if (phoneController.text.trim().isEmpty ||
            phoneController.text.trim().length < 10) {
          return ShowToast("Please enter a valid phone");
        }

        BlocProvider.of<CartBloc>(context).add(
          AddPhoneEvent(phone: phoneController.text.trim()),
        );

        Navigator.pop(context);
      },
      title: "Save",
      width: double.infinity,
    );
  }
}
