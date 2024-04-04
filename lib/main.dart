import 'package:bluetooth/home.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}







//             BLE
// ======================
// class BleController extends GetxController {
//   FlutterBlue ble = FlutterBlue.instance;

//   Stream<List<ScanResult>> get scanResults => ble.scanResults;

//   Future<void> scanDevices() async {
//     if (await Permission.bluetoothScan.request().isGranted &&
//         await Permission.bluetoothConnect.request().isGranted) {
//       ble.startScan(timeout: Duration(seconds: 10));
//     }
//   }
// }


//             HOME
// ======================
// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Bluetooth Connector"),
//       ),
//       body: GetBuilder<BleController>(
//         init: BleController(),
//         builder: (BleController controller) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: StreamBuilder<List<ScanResult>>(
//                     stream: controller.scanResults,
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         return ListView.builder(
//                           itemCount: snapshot.data!.length,
//                           itemBuilder: (context, index) {
//                             final data = snapshot.data![index];
//                             return Card(
//                               elevation: 2,
//                               child: ListTile(
//                                 title: Text(data.device.name ?? "Unknown"),
//                                 subtitle: Text(data.device.id.id),
//                                 trailing: Text(data.rssi.toString()),
//                               ),
//                             );
//                           },
//                         );
//                       } else {
//                         return const Center(child: Text("No device found"));
//                       }
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     controller.scanDevices();
//                   },
//                   child: Text("Scan"),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }