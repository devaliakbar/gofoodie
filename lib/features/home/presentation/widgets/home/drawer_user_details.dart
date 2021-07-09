import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/show_toast.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';
import 'package:gofoodie/features/profile/presentation/blocs/profile/profile_bloc.dart';

class DrawerUserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.heightWithoutSafeArea(18),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.drawer), fit: BoxFit.cover),
      ),
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width(5),
        ),
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            print("Profile Screen State Changed");

            if (state is ProfileErrorState) {
              ShowToast(state.message);
            }
          },
          builder: (context, state) {
            if (state is ProfileLoadedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: SizeConfig.height(1),
                    ),
                    width: SizeConfig.height(6),
                    height: SizeConfig.height(6),
                    child: ClipOval(
                      child: Image.asset(
                        AppImages.userIcon,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  NormalText(
                    state.profileData.name ?? "",
                    color: Colors.white,
                  ),
                  NormalText(
                    state.profileData.email ?? "",
                    color: Colors.white,
                  ),
                ],
              );
            } else if (state is ProfileInitialState) {
              BlocProvider.of<ProfileBloc>(context).add(
                ProfileLoadEvent(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
