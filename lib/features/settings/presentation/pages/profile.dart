import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/settings/presentation/widgets/profile_appbar.dart';
import 'package:gofoodie/features/settings/presentation/widgets/profile_edit_dialogue_body/email_edit_dialogue.dart';
import 'package:gofoodie/features/settings/presentation/widgets/profile_edit_dialogue_body/full_name_edit_dialogue.dart';
import 'package:gofoodie/features/settings/presentation/widgets/profile_edit_dialogue_body/password_edit_dialogue.dart';
import 'package:gofoodie/features/settings/presentation/widgets/profile_settings_field.dart';

class Profile extends StatelessWidget {
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NormalText(
                  "Change your Profile Settings",
                  boldText: true,
                  color: AppColors.black,
                  size: FontSizes.fontSizeL,
                ),
                SizedBox(
                  height: 15,
                ),
                ProfileSettingsField(
                  title: "Full Name",
                  value: "Ali Akbar",
                  onEditClick: () {
                    showDialog(
                      context: context,
                      child: FullNameEditDialogue(),
                    );
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ProfileSettingsField(
                  title: "Email",
                  value: "email@email.com",
                  onEditClick: () {
                    showDialog(
                      context: context,
                      child: EmailEditDialogue(),
                    );
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ProfileSettingsField(
                  title: "Password",
                  value: "*********",
                  onEditClick: () {
                    showDialog(
                      context: context,
                      child: PasswordEditDialogue(),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
