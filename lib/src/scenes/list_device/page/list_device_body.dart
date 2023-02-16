import 'package:ble_app/src/constants/app_colors.dart';
import 'package:ble_app/src/constants/app_text_style.dart';
import 'package:ble_app/src/scenes/list_device/wiget/available_devices_card.dart';
import 'package:ble_app/src/scenes/list_device/wiget/connected_devices_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ListDeviceBody extends StatelessWidget {
  const ListDeviceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => FlutterBluePlus.instance
          .startScan(timeout: const Duration(seconds: 4)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StreamBuilder<List<BluetoothDevice>>(
                stream: Stream.periodic(const Duration(seconds: 2))
                    .asyncMap((_) => FlutterBluePlus.instance.connectedDevices),
                initialData: const [],
                builder: (context, snapshot) {
                  final devices = snapshot.data;
                  if (devices != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        devices.isNotEmpty
                            ? Text(
                                'Connected',
                                style: AppTextStyle.customStyle(
                                  22,
                                  AppColors.main,
                                  FontWeight.bold,
                                ),
                              )
                            : const SizedBox(),
                        Column(
                          children: devices
                              .map((device) => ConnectedDeviceCard(
                                    device: device,
                                    onTap: () {},
                                  ))
                              .toList(),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              Text(
                'Available devices',
                style: AppTextStyle.customStyle(
                  22,
                  AppColors.main,
                  FontWeight.bold,
                ),
              ), //Handle scan results
              StreamBuilder<List<ScanResult>>(
                stream: FlutterBluePlus.instance.scanResults,
                initialData: const [],
                builder: ((context, snapshot) {
                  final results = snapshot.data;
                  if (results == null) {
                    return const SizedBox();
                  }
                  return Column(
                    children: results
                        .map(
                          (result) => AvailableDeviceCard(
                            result: result,
                            onTap: () {},
                          ),
                        )
                        .toList(),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
