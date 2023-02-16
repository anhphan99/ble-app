import 'package:ble_app/src/constants/app_colors.dart';
import 'package:ble_app/src/constants/app_text_style.dart';
import 'package:ble_app/src/constants/top_app_bar.dart';
import 'package:ble_app/src/scenes/scan/widget/connect_devices.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: TopAppBar.main(context),
      body: SafeArea(
        child: StreamBuilder<BluetoothState>(
          stream: FlutterBluePlus.instance.state,
          initialData: BluetoothState.unknown,
          builder: (context, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.off) {
              return Center(
                child: Text(
                  'Please turn on Bluetooth.',
                ),
              );
            }
            return ConnecteDevice();
          },
        ),
      ),
    );
  }
}
