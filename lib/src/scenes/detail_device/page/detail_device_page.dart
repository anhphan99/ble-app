import 'package:ble_app/src/constants/app_colors.dart';
import 'package:ble_app/src/constants/top_app_bar.dart';
import 'package:ble_app/src/scenes/detail_device/page/detail_device_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DetailDevicePage extends StatelessWidget {
  const DetailDevicePage({super.key, required this.device});
  final BluetoothDevice device;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: TopAppBar.detail(context, device.name),
      body: DetailDeviceBody(device: device),
    );
  }
}
