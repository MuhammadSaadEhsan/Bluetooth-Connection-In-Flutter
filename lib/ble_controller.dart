import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class BleController extends GetxController {
  FlutterBlue ble = FlutterBlue.instance;

  Stream<List<ScanResult>> get scanResults => ble.scanResults;

  Future<void> scanDevices() async {
    try {
      if (await Permission.bluetoothScan.request().isGranted &&
          await Permission.bluetoothConnect.request().isGranted) {
        await ble.startScan(timeout: Duration(seconds: 10));
      }
    } catch (e) {
      print("Error starting scan: $e");
    }
  }

  Future<void> connectToDevice(BluetoothDevice device, BuildContext context) async {
    await device.connect(timeout: Duration(seconds: 15));

    device.state.listen((isConnected) {
      if (BluetoothDeviceState.connecting == isConnected) {
        print("Device connecting to ${device.name}");
      } else if (BluetoothDeviceState.connected == isConnected) {
        print("Device connected to ${device.name}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Device connected successfully'),
          ),
        );
      } else {
        print("Device Disconnected");
      }
    });
  }
}