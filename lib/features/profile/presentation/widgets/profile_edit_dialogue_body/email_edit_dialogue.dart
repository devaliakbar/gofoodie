import 'package:flutter/material.dart';

import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_button.dart';
import 'package:gofoodie/core/widgets/custom_text_field.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/profile/domain/entities/profile_data.dart';

class EmailEditDialogue extends StatefulWidget {
  final ProfileData profile;
  EmailEditDialogue({@required this.profile});

  @override
  _EmailEditDialogueState createState() => _EmailEditDialogueState();
}

class _EmailEditDialogueState extends State<EmailEditDialogue> {
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.text = widget.profile.email;
  }

  @override
  void dispose() {
    emailController.dispose();
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
                      "Change Email",
                      color: AppColors.black,
                      boldText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      label: "New Email",
                      inputType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      onClick: () {},
                      title: "Save",
                      width: double.infinity,
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}