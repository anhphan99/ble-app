import 'package:ble_app/src/constants/app_colors.dart';
import 'package:ble_app/src/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopAppBar {
  static AppBar main(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: false,
      title: Text(
        'Connections',
        style: AppTextStyle.customStyle(22, AppColors.text, FontWeight.bold),
      ),
    );
  }

  static AppBar detail(BuildContext context, String title) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: false,
      leading: IconButton(
        icon: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SvgPicture.asset(
            'assets/images/ic_back.svg',
            width: 48,
            // height: 16,
          ),
        ),
        onPressed: () => Navigator.of(context).pop(true),
      ),
      title: Text(
        title,
        style: AppTextStyle.customStyle(22, AppColors.text, FontWeight.bold),
      ),
    );
  }
}
