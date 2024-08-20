import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:shimmer/shimmer.dart';

class GoogleView extends StatefulWidget {
  const GoogleView({super.key});

  @override
  State<GoogleView> createState() => _GoogleViewState();
}

class _GoogleViewState extends State<GoogleView> with LoadingStateMixin {
  final picker = ImagePicker();

  Future<File?> _pickProfile() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  List<Map<String, dynamic>> users = [
    {
      "name": "John Doe",
      "company": "Caliente iTech",
      "address":
          "235, Crystal plaza near devi darshan society punagam varachha surat",
      "distance": "0.045 km",
      "profileImage": null,
    },
    {
      "name": "Jane Smith",
      "company": "Tech Solutions",
      "address": "123 Tech Street, Silicon Valley",
      "distance": "1.2 km",
      "profileImage": null,
    },
    {
      "name": "Axar Patel",
      "company": "OTexh Solutions",
      "address":
          "123 Tech Street, Silicon Valley, near the pedar road varachaa surat gujarat",
      "distance": "2.96 km",
      "profileImage": null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: isLoading
              ? Shimmer.fromColors(
                  baseColor: BgColor.grey300!,
                  highlightColor: BgColor.grey100!,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FontsColor.white,
                      border: Border.all(width: 0.2, color: FontsColor.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    color: FontsColor.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                final profile = await _pickProfile();
                                if (profile != null) {
                                  setState(() {
                                    users[index]['profileImage'] = profile;
                                  });
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.18,
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: FontsColor.grey200,
                                ),
                                child: user['profileImage'] != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          user['profileImage'],
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Center(
                                        child: Text(
                                          "+",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f20,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.006,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  child: Icon(Icons.fiber_manual_record,
                                      size: 10, color: FontsColor.blue),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.006),
                                Text(user['distance'],
                                    style: TextStyle(
                                      fontFamily: FontsFamily.inter,
                                      fontSize: FontsSize.f10,
                                      color: FontsColor.blue,
                                    )),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(user['name'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            fontWeight: FontsWeight.bold,
                                            color: FontsColor.black)),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        MdiIcons.whatsapp,
                                        color: const Color.fromARGB(
                                            255, 16, 2, 90),
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Icon(
                                        MdiIcons.phoneOutline,
                                        color: const Color.fromARGB(
                                            255, 16, 2, 90),
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Image.asset(
                                        "assets/Icons/sendd.png",
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Text(user['company'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: FontsFamily.inter,
                                      fontSize: FontsSize.f12,
                                      color: FontsColor.black)),
                              Text(user['address'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: FontsFamily.inter,
                                      fontSize: FontsSize.f12,
                                      color: FontsColor.grey700)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
