import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcs/core/resources/app_assets.dart';
import 'package:mcs/core/styles/app_colors.dart';
import 'package:mcs/core/styles/ui_helper.dart';

class AnimatedAppBar extends StatelessWidget {
  final AnimationController colorAnimationController;
  final Animation colorTween, homeTween, workOutTween, iconTween, drawerTween;
  final Function onPressed;

  const AnimatedAppBar({
    Key? key,
    required this.colorAnimationController,
    required this.onPressed,
    required this.colorTween,
    required this.homeTween,
    required this.iconTween,
    required this.drawerTween,
    required this.workOutTween,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: AnimatedBuilder(
        animation: colorAnimationController,
        builder: (context, child) => AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.dehaze,
              color: drawerTween.value,
            ),
            onPressed: () {},
          ),
          backgroundColor: colorTween.value,
          elevation: 0,
          titleSpacing: 0.0,
          actions: <Widget>[
            Icon(
              Icons.notifications,
              color: iconTween.value,
            ),
            const Padding(
              padding: EdgeInsets.all(7),
              child: CircleAvatar(),
            ),
          ],
        ),
      ),
    );
  }
}
