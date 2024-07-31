// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ListPage extends StatefulWidget {
//   const ListPage({super.key});

//   @override
//   State<ListPage> createState() => _ListPageState();
// }

// class _ListPageState extends State<ListPage> {
//   final picker = ImagePicker();

//   Future<File?> _pickProfile() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       return File(pickedFile.path);
//     }
//     return null;
//   }

//   List<Map<String, dynamic>> users = [
//     {
//       "name": "John Doe",
//       "company": "Caliente iTech",
//       "address":
//           "235, Crystal plaza near devi darshan society punagam varachha surat",
//       "distance": "0.045 km",
//       "profileImage": null,
//     },
//     {
//       "name": "Jane Smith",
//       "company": "Tech Solutions",
//       "address": "123 Tech Street, Silicon Valley",
//       "distance": "1.2 km",
//       "profileImage": null,
//     },
//     {
//       "name": "Axar Patel",
//       "company": "OTexh Solutions",
//       "address":
//           "123 Tech Street, Silicon Valley, near the pedar road varachaa surat gujarat",
//       "distance": "2.96 km",
//       "profileImage": null,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
//         child: ListView.builder(
//           itemCount: users.length,
//           itemBuilder: (context, index) {
//             final user = users[index];
//             return Container(
//               margin: const EdgeInsets.only(bottom: 10),
//               decoration: BoxDecoration(
//                 border: Border.all(width: 0.2, color: Colors.grey),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Column(
//                       children: [
//                         InkWell(
//                           onTap: () async {
//                             final profile = await _pickProfile();
//                             if (profile != null) {
//                               setState(() {
//                                 users[index]['profileImage'] = profile;
//                               });
//                             }
//                           },
//                           child: Container(
//                             width: 60,
//                             height: 60,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.grey[300],
//                             ),
//                             child: user['profileImage'] != null
//                                 ? ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: Image.file(
//                                       user['profileImage'],
//                                       fit: BoxFit.cover,
//                                     ),
//                                   )
//                                 : Center(
//                                     child: Text(
//                                       "+",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontFamily: 'Inter',
//                                         fontSize: 20.sp,
//                                         color: Colors.grey[600],
//                                       ),
//                                     ),
//                                   ),
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               height: 15,
//                               child: Icon(Icons.fiber_manual_record,
//                                   size: 10, color: Colors.blue),
//                             ),
//                             SizedBox(width: 3),
//                             Text(
//                               user['distance'],
//                               style: TextStyle(
//                                   fontSize: 10.sp,
//                                   fontFamily: 'Inter',
//                                   color: Colors.blue),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(width: 15),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   user['name'],
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                       fontFamily: 'Inter',
//                                       fontSize: 14.sp,
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Image.asset(
//                                     "assets/wp.png",
//                                     height: 30,
//                                     width: 30,
//                                   ),
//                                   SizedBox(width: 5),
//                                   Icon(Icons.call),
//                                   SizedBox(width: 5),
//                                   Icon(Icons.send),
//                                 ],
//                               )
//                             ],
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             user['company'],
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontSize: 12.sp,
//                                 color: Colors.grey),
//                           ),
//                           SizedBox(height: 3),
//                           Text(
//                             user['address'],
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontSize: 12.sp,
//                                 color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
