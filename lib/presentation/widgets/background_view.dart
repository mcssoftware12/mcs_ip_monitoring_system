import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:mcs/core/resources/app_assets.dart';
import 'package:mcs/core/styles/ui_helper.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.asset(
      R.ASSETS_IMAGES_BG_JPG,
      alignment: Alignment.topCenter,
      fit: BoxFit.cover,
      width: screenWidth(context),
      height: screenHeightPercentage(context, percentage: 0.48),
    );
  }
}
