import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/show_toast.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/custom_button.dart';
import 'package:gofoodie/core/widgets/custom_text_field.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/profile/domain/entities/profile_data.dart';
import 'package:gofoodie/features/profile/domain/usecases/change_password.dart';
import 'package:gofoodie/features/profile/presentation/blocs/profile/profile_bloc.dart';

class PasswordEditDialogue extends StatefulWidget {
  final ProfileData profile;
  PasswordEditDialogue({@required this.profile});

  @override
  _PasswordEditDialogueState createState() => _PasswordEditDialogueState();
}

class _PasswordEditDialogueState extends State<PasswordEditDialogue> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
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
                      "Change Password",
                      color: AppColors.black,
                      boldText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      label: "Old Password",
                      obsecure: true,
                      controller: oldPasswordController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      label: "New Password",
                      obsecure: true,
                      controller: newPasswordController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    BlocConsumer<ProfileBloc, ProfileState>(
                      listener: (context, state) {
                        if (state is ProfileSavingErrorState) {
                          ShowToast(state.message);
                        }

                        if (state is ProfileLoadedState) {
                          Navigator.pop(context);
                        }
                      },
                      builder: (context, state) {
                        if (state is ProfileLoadedState) {
                          return _buildSaveButton(state.profileData);
                        }
                        if (state is ProfileSavingErrorState) {
                          return _buildSaveButton(state.profileData);
                        }
                        return CustomButton(
                          onClick: () {},
                          title: "Save",
                          width: double.infinity,
                          isLoading: true,
                        );
                      },
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton(ProfileData profileData) {
    return CustomButton(
      onClick: () {
        if (oldPasswordController.text.trim() == "") {
          return ShowToast("Please enter old Password");
        }

        if (newPasswordController.text.trim() == "") {
          return ShowToast("Please enter New Password");
        }

        if (newPasswordController.text.trim().length < 8) {
          return ShowToast(AppString.passwordLength);
        }

        BlocProvider.of<ProfileBloc>(context).add(
          ChangePasswordEvent(
              oldPassword: oldPasswordController.text.trim(),
              newPassword: newPasswordController.text.trim(),
              profileData: profileData),
        );
      },
      title: "Save",
      width: double.infinity,
    );
  }
}
