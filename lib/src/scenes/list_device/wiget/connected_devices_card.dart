import 'package:ble_app/src/constants/app_colors.dart';
import 'package:ble_app/src/constants/app_text_style.dart';
import 'package:ble_app/src/scenes/detail_device/page/detail_device_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ConnectedDeviceCard extends StatelessWidget {
  const ConnectedDeviceCard(
      {super.key, required this.device, required this.onTap});

  final BluetoothDevice device;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return device.name.isNotEmpty
        ? InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailDevicePage(device: device),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.main.withOpacity(0.05),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(1, 3),
                    ),
                  ]),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/img_unknown.png',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          device.name,
                          style: AppTextStyle.customStyle(
                            16,
                            AppColors.main,
                            FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          device.id.id,
                          maxLines: 2,
                          style: AppTextStyle.customStyle(
                            14,
                            AppColors.main,
                            FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 4),
                        StreamBuilder<BluetoothDeviceState>(
                          stream: device.state,
                          initialData: BluetoothDeviceState.disconnected,
                          builder: (c, snapshot) {
                            final state = snapshot.data;
                            if (state == BluetoothDeviceState.connected) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 5),
                                decoration: BoxDecoration(
                                    color: AppColors.main,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "Open",
                                  style: AppTextStyle.customStyle(
                                      12, AppColors.white, FontWeight.bold),
                                ),
                              );
                            } else {
                              return Text(state!.name.toUpperCase());
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
