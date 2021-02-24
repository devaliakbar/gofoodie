import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';

class NormalText extends StatelessWidget {
  final String text;
  final Color color;
  final bool boldText;
  final double size;
  final bool truncate;
  final TextAlign textAlign;
  final int maxLine;

  NormalText(this.text,
      {this.color,
      this.boldText = false,
      this.size,
      this.truncate = false,
      this.textAlign = TextAlign.start,
      this.maxLine = 1});

  @override
  Widget build(BuildContext context) {
    TextOverflow overflowStyle = TextOverflow.visible;
    if (truncate) {
      overflowStyle = TextOverflow.ellipsis;
    }

    return Text(
      text,
      overflow: overflowStyle,
      textAlign: textAlign,
      style: TextStyle(
          color: color == null ? AppColors.lightBlack : color,
          fontSize: size == null ? FontSizes.fontSizeM : size,
          fontWeight: boldText ? FontWeight.bold : FontWeight.normal),
      maxLines: truncate ? maxLine : null,
    );
  }
}
