import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/show_toast.dart';
import 'package:gofoodie/core/widgets/loading_view.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/settings/presentation/blocs/profile/profile_bloc.dart';
import 'package:gofoodie/features/settings/presentation/widgets/profile_appbar.dart';
import 'package:gofoodie/features/settings/presentation/widgets/profile_edit_dialogue_body/email_edit_dialogue.dart';
import 'package:gofoodie/features/settings/presentation/widgets/profile_edit_dialogue_body/full_name_edit_dialogue.dart';
import 'package:gofoodie/features/settings/presentation/widgets/profile_edit_dialogue_body/password_edit_dialogue.dart';
import 'package:gofoodie/features/settings/presentation/widgets/profile_settings_field.dart';

class Profile extends StatelessWidget {
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileBloc>(context).add(
      ProfileLoadEvent(),
    );

    return Scaffold(
      appBar: ProfileAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              print("Profile Screen State Changed");

              if (state is ProfileErrorState) {
                ShowToast(state.message);
              }
            },
            buildWhen: (previous, current) {
              if (current is ProfileErrorState ||
                  current is ProfileSavingState ||
                  current is ProfileSavingErrorState) {
                return false;
              }

              return true;
            },
            builder: (context, state) {
              if (state is ProfileLoadedState) {
                return SingleChildScrollView(
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
                        value: state.profileData.name,
                        onEditClick: () {
                          showDialog(
                            context: context,
                            child: FullNameEditDialogue(
                              profile: state.profileData,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ProfileSettingsField(
                        title: "Email",
                        value: state.profileData.email,
                        onEditClick: () {
                          showDialog(
                            context: context,
                            child: EmailEditDialogue(
                              profile: state.profileData,
                            ),
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
                            child: PasswordEditDialogue(
                              profile: state.profileData,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                );
              }
              return Center(
                child: LoadingView(),
              );
            },
          ),
        ),
      ),
    );
  }
}
