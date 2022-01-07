// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:rust_controll/data/class_server.dart';
// import 'package:rust_controll/requests/requestsToPanel.dart';

// class editStartupScreen extends StatefulWidget {
//   const editStartupScreen({
//     Key? key,
//     required this.server,
//   }) : super(key: key);

//   final Server server;

//   @override
//   _editStartupScreenState createState() => _editStartupScreenState(server);
// }

// class _editStartupScreenState extends State<editStartupScreen> {
//   final Server server;

//   _editStartupScreenState(this.server);

//   Map serverSettings = {};

//   generateWidgets() async {
//     serverSettings = await getServerCFG(server);
//     setState(() {
//       serverSettings = serverSettings;
//     });
//   }

//   settingsCard(String title, String hintText, String helperText,
//       Function(String) func, var initialValue) {
//     return SizedBox(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 10, left: 20),
//             child: Text(
//               title,
//               style: const TextStyle(fontSize: 20, color: Colors.white),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
//             child: TextFormField(
//               initialValue: initialValue,
//               cursorColor: Colors.white,
//               style: const TextStyle(color: Colors.white, fontSize: 20),
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 hintStyle: const TextStyle(color: Colors.white30),
//                 helperText: helperText,
//                 helperStyle: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 14,
//                 ),
//               ),
//               onChanged: func,
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     generateWidgets();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text(
//           "Edit server",
//           style: TextStyle(color: Colors.black),
//         ),
//         actions: [
//           Padding(
//             padding: EdgeInsets.all(5),
//             child: ElevatedButton(
//               onPressed: () {
//                 setServerCFG(server, serverSettings);
//                 Navigator.pop(context);
//                 // Navigator.pop(context);
//               },
//               child: const Icon(Icons.save),
//               style: ButtonStyle(
//                 shape: MaterialStateProperty.all(CircleBorder()),
//                 backgroundColor:
//                     MaterialStateProperty.all(Colors.blue), // <-- Button color
//                 overlayColor:
//                     MaterialStateProperty.resolveWith<Color?>((states) {
//                   if (states.contains(MaterialState.pressed))
//                     return Colors.green; // <-- Splash color
//                 }),
//               ),
//             ),
//           )
//         ],
//       ),
//       body: Container(
//         color: Colors.grey.withOpacity(0.1),
//         child: ListView(
//           padding: EdgeInsets.all(20),
//           children: [
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.blueAccent,
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(20),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.blue.withOpacity(0.5),
//                     spreadRadius: 2,
//                     blurRadius: 6,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     settingsCard("Card1", "hintText", "helperText",
//                         (p0) => {print("1")}, "initialValue"),
//                     Divider(),
//                     settingsCard("Card1", "hintText", "helperText",
//                         (p0) => {print("1")}, "initialValue"),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
