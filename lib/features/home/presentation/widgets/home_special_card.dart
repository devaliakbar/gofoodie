import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';
import 'package:gofoodie/core/services/size_config.dart';
import 'package:gofoodie/core/widgets/normal_text.dart';

class HomeSpecialCard extends StatelessWidget {
  final String text;
  final Color color;
  final Function onClick;

  HomeSpecialCard(
      {@required this.text, @required this.color, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: SizeConfig.height(8),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: NormalText(
                text,
                size: FontSizes.fontSizeXS,
                color: color,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: IconSizes.iconSizeXXXS,
              color: color,
            )
          ],
        ),
      ),
    );
  }
}
