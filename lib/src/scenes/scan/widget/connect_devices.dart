import 'package:ble_app/src/constants/app_colors.dart';
import 'package:ble_app/src/constants/app_text_style.dart';
import 'package:ble_app/src/scenes/list_device/page/list_device.dart';
import 'package:flutter/material.dart';

class ConnecteDevice extends StatelessWidget {
  const ConnecteDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/ic_connection.png'),
          const SizedBox(height: 50),
          Text(
            'Connect a new device',
            style:
                AppTextStyle.customStyle(22, AppColors.text, FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 350,
            child: Text(
              'Press the button to the thermometer once to pair it with the application.',
              textAlign: TextAlign.center,
              style: AppTextStyle.customStyle(
                  16, AppColors.text, FontWeight.normal),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: 250.0,
            height: 50.0,
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ListDevices()),
              ),
              style: ElevatedButton.styleFrom(
                  primary: AppColors.main,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text(
                'Connect device',
                style: AppTextStyle.customStyle(
                    16, AppColors.white, FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
