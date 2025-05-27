import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_base_app/config/theme/app_theme.dart';

@override
Widget drawerWidget404(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Container(
    height: size.height,
    width: size.width,
    color: AppTheme.white,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [SvgPicture.asset(AppTheme.icon404Path, fit: BoxFit.fill,)],
      ),
    ),
  );
}
