import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';

import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Views/Components/AppBar/fullAppbar.dart';
import 'package:progress_alliance/Views/Widgets/drawer.dart';
import 'package:shimmer/shimmer.dart';

class Retailer extends StatefulWidget {
  const Retailer({super.key});

  @override
  State<Retailer> createState() => _RetailerState();
}

class _RetailerState extends State<Retailer> with LoadingStateMixin {
  final picker = ImagePicker();

  Future<File?> _pickProfile() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  List<Map<String, dynamic>> retailer = [
    {
      "name": "Mansoft",
      "work": "Computer & CCTV",
      "owner": "Praful Desai",
      "address": "123 Tech Street, Silicon Valley",
      "profileImage": null,
    },
    {
      "name": "Otlo The Cafe By Maheshivaay Enterprise",
      "work": "Food",
      "owner": "Monik Patel",
      "address": "123 Tech Street, Silicon Valley, tornito canada",
      "profileImage": null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        appBar: CustomeAppBar(
          title: "Retailer",
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(
                    Icons.more_vert,
                    size: MediaQuery.of(context).size.width * 0.06,
                  ),
                );
              },
            ),
          ],
        ),
        endDrawer: const Enddrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: ListView.builder(
            itemCount: retailer.length,
            itemBuilder: (context, index) {
              final retailers = retailer[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.memberDetailRoute);
                },
                child: isLoading
                    ? Shimmer.fromColors(
                        baseColor: BgColor.grey300!,
                        highlightColor: BgColor.grey100!,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(bottom: 5),
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FontsColor.white,
                            border:
                                Border.all(width: 0.2, color: FontsColor.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ))
                    : Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.2, color: FontsColor.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: InkWell(
                                  onTap: () async {
                                    final profile = await _pickProfile();
                                    if (profile != null) {
                                      setState(() {
                                        retailer[index]['profileImage'] =
                                            profile;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: FontsColor.grey300,
                                    ),
                                    child: retailers['profileImage'] != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.file(
                                              retailers['profileImage'],
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
                                                color: FontsColor.grey600,
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.03,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      retailers['name'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f13,
                                          color: const Color.fromARGB(
                                              255, 16, 2, 90),
                                          fontWeight: FontsWeight.bold),
                                    ),
                                    Text(
                                      retailers['work'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f12,
                                        fontWeight: FontsWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 16, 2, 90),
                                      ),
                                    ),
                                    Text(retailers['owner'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey800)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.003,
                                    ),
                                    Text(retailers['address'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
