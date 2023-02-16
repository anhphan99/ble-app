// ignore_for_file: unused_local_variable, unrelated_type_equality_checks, unused_element, avoid_print

import 'package:ble_app/src/constants/app_colors.dart';
import 'package:ble_app/src/constants/app_text_style.dart';
import 'package:ble_app/src/helper/untils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothServiceTitle extends StatefulWidget {
  const BluetoothServiceTitle({super.key, required this.service});
  final BluetoothService service;
//   // final List<CharacteristicTile> characteristicTiles;

  @override
  State<BluetoothServiceTitle> createState() => _BluetoothServiceTitleState();
}

class _BluetoothServiceTitleState extends State<BluetoothServiceTitle> {
  late BluetoothCharacteristic heartRateCharacteristic;

  @override
  Widget build(BuildContext context) {
    BluetoothService service = widget.service;
    List<BluetoothCharacteristic> characteristics = service.characteristics;

    void listerDataChange(BluetoothCharacteristic characteristic) async {
      print("===LISTEN-===");
      await characteristic.setNotifyValue(true);
      characteristic.value.listen((value) {
        print('UUID: ${characteristic.uuid}');
        print("Value change: $value");
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        child: ExpansionTile(
          title: Row(
            children: [
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      convertUuidToLabel(service.uuid.toString()),
                      maxLines: 1,
                      style: AppTextStyle.customStyle(
                        14,
                        AppColors.main,
                        FontWeight.bold,
                      ),
                    ),
                    Text(
                      '0x${service.uuid.toString().toUpperCase().substring(4, 8)}',
                      maxLines: 1,
                      style: AppTextStyle.customStyle(
                        12,
                        AppColors.main,
                        FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          children: <Widget>[
            ListView.builder(
                itemCount: characteristics.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  listerDataChange(characteristics[index]);
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(34, 8, 8, 8),
                      child: Row(
                        // crossAxisAlignment: ,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                convertUuidToLabel(
                                  characteristics[index].uuid.toString(),
                                ),
                              ),
                              StreamBuilder<List<int>>(
                                stream: characteristics[index].value,
                                initialData: characteristics[index].lastValue,
                                builder: ((context, snapshot) {
                                  if (snapshot.data!.isEmpty) {
                                    return const Text('No Data');
                                  }
                                  return Text(snapshot.data.toString());
                                }),
                              )
                            ],
                          ),
                        ],
                      ));
                }),
          ],
        ),
      ),
    );
  }
}

// class ServiceTile extends StatefulWidget {
//   ServiceTile({super.key, required this.characteristic});

//   BluetoothCharacteristic characteristic;

//   @override
//   State<ServiceTile> createState() => _ServiceTileState();
// }

// class _ServiceTileState extends State<ServiceTile> {
//   late BluetoothCharacteristic characteristic;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     listerDataChange();
//   }

//   listerDataChange() async {
//     characteristic = widget.characteristic;
//     await characteristic.setNotifyValue(true);
//     characteristic.value.listen((value) {
//       print('UUID: ${characteristic.uuid}');
//       print("Value change: $value");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text(widget.characteristic.value.toString());
//   }
// }
