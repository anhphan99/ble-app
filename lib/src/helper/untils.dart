String convertUuidToLabel(String uuid) {
  final Map<String, String> uuidMap = {
    "0000180a-0000-1000-8000-00805f9b34fb": "Device Information",
    "00002a25-0000-1000-8000-00805f9b34fb": "Serial Number",
    "00002a23-0000-1000-8000-00805f9b34fb": "System ID",
    "00002a27-0000-1000-8000-00805f9b34fb": "Hardware Revision",
    "00002a28-0000-1000-8000-00805f9b34fb": "Software Revision",
    "00002a50-0000-1000-8000-00805f9b34fb": "PnP ID",
    "00001530-0000-3512-2118-0009af100700": "Proximity Profile",
    "00001532-0000-3512-2118-0009af100700": "HID",
    "00001811-0000-1000-8000-00805f9b34fb": "Alert Notification Service",
    "00002a46-0000-1000-8000-00805f9b34fb": "New Alert",
    "00002a44-0000-1000-8000-00805f9b34fb": "Alert Notification Control Point",
    "00001802-0000-1000-8000-00805f9b34fb": "Immediate Alert",
    "00002A06-0000-1000-8000-00805f9b34fb": "Alert level",
    "0000180d-0000-1000-8000-00805f9b34fb": "Heart Rate",
    "00002a37-0000-1000-8000-00805f9b34fb": "Heart Rate Measurement",
    "00002a39-0000-1000-8000-00805f9b34fb": "Heart Rate Control Point",
    "00002a2b-0000-1000-8000-00805f9b34fb": "Current Time",
    "00000003-0000-3512-2118-0009af100700": "Characteristic Configuration",
    "0002a04-0000-1000-8000-00805f9b34fb":
        "Peripheral Preferred Connection Parameters",
    "0000fee0-0000-1000-8000-00805f9b34fb": "Mi Band Services",
    "0000fee1-0000-1000-8000-00805f9b34fb": "Mi Band Services"
    // Add more UUIDs and their corresponding labels here
  };

  return uuidMap[uuid] ?? uuid;
}

// String convertHexToServiceName(String hexCode) {
//   return '0x${uuid.toString().toUpperCase().substring(4, 8)}';
// }

String convertHex(String uuid) {
  return '0x${uuid.toString().toUpperCase().substring(4, 8)}';
}
