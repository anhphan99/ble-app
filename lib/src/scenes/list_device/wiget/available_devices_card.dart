import 'package:ble_app/src/constants/app_colors.dart';
import 'package:ble_app/src/constants/app_text_style.dart';
import 'package:ble_app/src/extension/string_extension.dart';
import 'package:ble_app/src/scenes/detail_device/page/detail_device_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class AvailableDeviceCard extends StatelessWidget {
  const AvailableDeviceCard(
      {super.key, required this.result, required this.onTap});

  final ScanResult result;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return result.device.name.isNotEmpty
        ? StreamBuilder<BluetoothDeviceState>(
            stream: result.device.state,
            initialData: BluetoothDeviceState.disconnected,
            builder: (c, snapshot) {
              final state = snapshot.data;
              if (state == BluetoothDeviceState.disconnected) {
                return InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    result.device.connect();
                    return DetailDevicePage(device: result.device);
                  })),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
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
                                result.device.name,
                                style: AppTextStyle.customStyle(
                                  16,
                                  AppColors.main,
                                  FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                result.device.id.id,
                                maxLines: 2,
                                style: AppTextStyle.customStyle(
                                  12,
                                  AppColors.main,
                                  FontWeight.normal,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 5),
                                decoration: BoxDecoration(
                                    color: AppColors.main,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  state!.name.capitalize(),
                                  style: AppTextStyle.customStyle(
                                      12, AppColors.white, FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          )
        : const SizedBox();
  }
}
