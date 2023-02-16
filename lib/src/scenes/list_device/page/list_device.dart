import 'package:ble_app/src/constants/app_colors.dart';
import 'package:ble_app/src/constants/top_app_bar.dart';
import 'package:ble_app/src/scenes/list_device/page/list_device_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ListDevices extends StatefulWidget {
  const ListDevices({super.key});

  @override
  State<ListDevices> createState() => _ListDevicesState();
}

class _ListDevicesState extends State<ListDevices> {
  @override
  void initState() {
    super.initState();
    FlutterBluePlus.instance.startScan(timeout: const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: TopAppBar.detail(context, 'Devices'),
      body: const ListDeviceBody(),
    );
  }
}
