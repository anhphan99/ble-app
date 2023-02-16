// ignore_for_file: unrelated_type_equality_checks

import 'package:ble_app/src/constants/app_colors.dart';
import 'package:ble_app/src/constants/app_text_style.dart';
import 'package:ble_app/src/scenes/detail_device/widget/bluetooth_service_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:io' show Platform;

class DetailDeviceBody extends StatelessWidget {
  const DetailDeviceBody({super.key, required this.device});

  Stream<int> rssiStream() async* {
    var isConnected = true;
    final subscription = device.state.listen((state) {
      isConnected = state == BluetoothDeviceState.connected;
    });
    while (isConnected) {
      yield await device.readRssi();
      await Future.delayed(const Duration(seconds: 1));
    }
    subscription.cancel();
    // Device disconnected, stopping RSSI stream
  }

  final BluetoothDevice device;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder<BluetoothDeviceState>(
            stream: device.state,
            initialData: BluetoothDeviceState.connecting,
            builder: (c, snapshot) => ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  snapshot.data == BluetoothDeviceState.connected
                      ? const Icon(Icons.bluetooth_connected)
                      : const Icon(Icons.bluetooth_disabled),
                  snapshot.data == BluetoothDeviceState.connected
                      ? StreamBuilder<int>(
                          stream: rssiStream(),
                          builder: (context, snapshot) {
                            return Text(
                                snapshot.hasData ? '${snapshot.data}dBm' : '',
                                style: Theme.of(context).textTheme.caption);
                          })
                      : Text('', style: Theme.of(context).textTheme.caption),
                ],
              ),
              title: Text(
                  '${device.name} is ${snapshot.data.toString().split('.')[1]}.'),
              subtitle: Text('${device.id}'),
              trailing: StreamBuilder<bool>(
                stream: device.isDiscoveringServices,
                initialData: false,
                builder: (c, s) => IndexedStack(
                  index: s.data! ? 1 : 0,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () async {
                        if (snapshot.connectionState !=
                            BluetoothDeviceState.connected) {
                          await device.connect();
                        }
                        device.discoverServices();
                      },
                    ),
                    const IconButton(
                      icon: SizedBox(
                        width: 18.0,
                        height: 18.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.grey),
                        ),
                      ),
                      onPressed: null,
                    )
                  ],
                ),
              ),
            ),
          ),
          Platform.isAndroid
              ? StreamBuilder<int>(
                  stream: device.mtu,
                  initialData: 0,
                  builder: (c, snapshot) => ListTile(
                    title: const Text('MTU Size'),
                    subtitle: Text('${snapshot.data} bytes'),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => device.requestMtu(512),
                    ),
                  ),
                )
              : const SizedBox(),
          StreamBuilder<List<BluetoothService>>(
            stream: device.services,
            initialData: const [],
            builder: (c, snapshot) {
              final services = snapshot.data;
              if (services != null) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BluetoothServiceTitle(
                      service: services[index],
                    );
                  },
                );
              } else {
                return Center(
                  child: Text(
                    "Services not found!",
                    style: AppTextStyle.customStyle(
                      16,
                      AppColors.text,
                      FontWeight.bold,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
