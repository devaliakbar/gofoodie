import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gofoodie/core/res/app_resources.dart';

class ImageFromNetwork extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  ImageFromNetwork({@required this.imageUrl, this.fit = BoxFit.cover});
  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return Icon(
        Icons.broken_image_outlined,
        size: IconSizes.iconSizeXL,
        color: Colors.black.withOpacity(0.7),
      );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.broken_image_outlined,
        size: IconSizes.iconSizeXL,
        color: Colors.black.withOpacity(0.7),
      ),
    );
  }
}
