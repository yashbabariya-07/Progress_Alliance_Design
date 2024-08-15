import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:progress_alliance/Views/Components/AppBar/fullAppbar.dart';
import 'package:progress_alliance/Views/Components/ShimmerAnimation/HomeFieldShimmer.dart/notificationShimmer.dart';

class DeatailPage extends StatefulWidget {
  const DeatailPage({super.key});

  @override
  State<DeatailPage> createState() => _DeatailPageState();
}

class _DeatailPageState extends State<DeatailPage> with LoadingStateMixin {
  File? _coverImage;

  Future<void> _pickCoverImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _coverImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMM yyyy').format(now);
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        appBar: CustomeAppBar(
          title: "#Your Lead Code",
          actions: [
            IconButton(
              onPressed: () {},
              icon: Text(
                "Remove",
                style: TextStyle(
                    fontFamily: FontsFamily.inter,
                    fontSize: FontsSize.f13,
                    color: Colors.red,
                    fontWeight: FontsWeight.bold),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
          child: isLoading
              ? const Notificationshimmer()
              : Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * 0.24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: FontsColor.grey200),
                        child: _coverImage != null
                            ? Image.file(
                                _coverImage!,
                                fit: BoxFit.cover,
                              )
                            : Center(
                                child: Icon(
                                Icons.add,
                                size: MediaQuery.of(context).size.width * 0.1,
                              ))),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Text(
                      "Company/Industrie Name",
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f15,
                          fontWeight: FontsWeight.bold),
                    ),
                    Text(
                      "Company Name",
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f14,
                          color: FontsColor.grey),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.024,
                    ),
                    Divider(
                      thickness: 0.5,
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date',
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  fontSize: FontsSize.f13,
                                  color: FontsColor.grey),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            Text(
                              formattedDate,
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  fontSize: FontsSize.f13,
                                  fontWeight: FontsWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.024,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Member's Need",
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  fontSize: FontsSize.f13,
                                  color: FontsColor.grey),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            Text(
                              "Your Needed Filed",
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  fontSize: FontsSize.f13,
                                  color: FontsColor.purple,
                                  fontWeight: FontsWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.024,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description",
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  fontSize: FontsSize.f13,
                                  color: FontsColor.grey),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            Text(
                              "No Description",
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  fontSize: FontsSize.f13,
                                  fontWeight: FontsWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: FontsColor.grey200),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      MdiIcons.phoneOutline,
                                      color: FontsColor.purple,
                                      size: MediaQuery.of(context).size.width *
                                          0.06,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01,
                                    ),
                                    Text(
                                      'Call',
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f13,
                                          fontWeight: FontsWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: FontsColor.grey200),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/Icons/wp.png",
                                      width: MediaQuery.of(context).size.width *
                                          0.07,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01,
                                    ),
                                    Text(
                                      'Whatsapp',
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f13,
                                          fontWeight: FontsWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
