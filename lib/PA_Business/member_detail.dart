import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberDetail extends StatefulWidget {
  const MemberDetail({super.key});

  @override
  State<MemberDetail> createState() => _MemberDetailState();
}

class _MemberDetailState extends State<MemberDetail>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  File? _coverImage;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

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
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          forceMaterialTransparency: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              color: Colors.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Member Details",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16.sp,
              color: const Color.fromARGB(255, 16, 2, 90),
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  MdiIcons.accountPlusOutline,
                  color: const Color.fromARGB(255, 16, 2, 90),
                  size: MediaQuery.of(context).size.width * 0.06,
                )),
          ],
        ),
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15,
                  color: Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Text(
                      "Cover Photo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -MediaQuery.of(context).size.width * 0.13,
                  left: MediaQuery.of(context).size.width * 0.38,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.15,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.146,
                          child: Icon(
                            Icons.person,
                            size: MediaQuery.of(context).size.width * 0.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.062,
            ),
            Column(
              children: [
                Text(
                  "Member name",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "PROGRESS ALLIANCE FAMILY",
                  style: TextStyle(
                      fontFamily: 'Inter', fontSize: 13.sp, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.024,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      const phoneNumber = 'tel:7874118535';
                      if (await canLaunch(phoneNumber)) {
                        await launch(phoneNumber);
                      } else {
                        throw 'Could not launch $phoneNumber';
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.28,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[300]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            MdiIcons.phoneOutline,
                            size: MediaQuery.of(context).size.width * 0.06,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Text(
                            'Call',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      launch('https://wa.me/7874118535');
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.28,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[300]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            MdiIcons.whatsapp,
                            size: MediaQuery.of(context).size.width * 0.06,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Text(
                            'Whatsapp',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.28,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[300]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            MdiIcons.accountGroupOutline,
                            size: MediaQuery.of(context).size.width * 0.06,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Text(
                            '1-2-1',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.024,
            ),
            TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: const Color.fromARGB(255, 16, 2, 90),
              labelStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.sp,
                color: const Color.fromARGB(255, 16, 2, 90),
                fontWeight: FontWeight.bold,
              ),
              tabs: const [
                Tab(text: "Personal"),
                Tab(text: "Business"),
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: TabBarView(controller: _tabController, children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                MdiIcons.phoneOutline,
                                color: Colors.grey[500],
                                size: MediaQuery.of(context).size.width * 0.06,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mobile Number',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    '1234567896',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                MdiIcons.calendarMonthOutline,
                                color: Colors.grey[500],
                                size: MediaQuery.of(context).size.width * 0.06,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Date Of Birth',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    '12/12/2025',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                MdiIcons.calendarMonthOutline,
                                color: Colors.grey[500],
                                size: MediaQuery.of(context).size.width * 0.06,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Marriage Anniversary',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    '25/12/2022',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                MdiIcons.phoneOutline,
                                color: Colors.grey[500],
                                size: MediaQuery.of(context).size.width * 0.06,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Emergency Contact',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 13.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Person Name',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.54,
                                      ),
                                      Icon(
                                        MdiIcons.phoneOutline,
                                        color: const Color.fromARGB(
                                            255, 16, 2, 90),
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '1234567890',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                MdiIcons.mapMarkerOutline,
                                color: Colors.grey[500],
                                size: MediaQuery.of(context).size.width * 0.06,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Address',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    'Your address',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.008,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      launch('https://maps.google.com');
                                    },
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.33,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.grey[300]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Get Direction',
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Colors.blue,
                                                  fontSize: 13.sp),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01,
                                            ),
                                            Image.asset(
                                              "assets/sendd.png",
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                              color: Colors.blue,
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                MdiIcons.accountOutline,
                                color: Colors.grey[500],
                                size: MediaQuery.of(context).size.width * 0.06,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Introducer Details',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 13.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.83,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 0.5, color: Colors.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.04,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03,
                                                ),
                                                Text(
                                                  'Introducer Name',
                                                  style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/wp.png",
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.07,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.01,
                                                ),
                                                Icon(
                                                  MdiIcons.phoneOutline,
                                                  color: Colors.grey[500],
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.06,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.01,
                                                ),
                                                Icon(
                                                  MdiIcons.accountPlusOutline,
                                                  color: Colors.grey[500],
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.06,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.19,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300]),
                                    child: _coverImage != null
                                        ? Image.file(
                                            _coverImage!,
                                            fit: BoxFit.cover,
                                          )
                                        : Center(
                                            child: Icon(
                                            Icons.add,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.06,
                                          ))),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Text(
                                  'Your Brand Name',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.012,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Brand Name',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 15.sp,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                              ),
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: Colors.grey[300],
                                child: Center(
                                  child: Icon(
                                    MdiIcons.pencilOutline,
                                    size: MediaQuery.of(context).size.width *
                                        0.045,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                MdiIcons.shoppingOutline,
                                color: Colors.grey[500],
                                size: MediaQuery.of(context).size.width * 0.06,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Business Type',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    'Business type',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                MdiIcons.viewAgendaOutline,
                                color: Colors.grey[500],
                                size: MediaQuery.of(context).size.width * 0.06,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Category',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    'Type of category',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                MdiIcons.viewAgendaOutline,
                                color: Colors.grey[500],
                                size: MediaQuery.of(context).size.width * 0.06,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sub Category',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    'Type of sub-category',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                MdiIcons.hexagonOutline,
                                color: Colors.grey[500],
                                size: MediaQuery.of(context).size.width * 0.06,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Formation',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    'Business formation',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                MdiIcons.calendarMonthOutline,
                                color: Colors.grey[500],
                                size: MediaQuery.of(context).size.width * 0.06,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Establishment',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    '01/12/2025',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                MdiIcons.phoneOutline,
                                color: Colors.grey[500],
                                size: MediaQuery.of(context).size.width * 0.06,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mobile Number',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    '1234567896',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                MdiIcons.mapMarkerOutline,
                                color: Colors.grey[500],
                                size: MediaQuery.of(context).size.width * 0.06,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Address',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    'Your address',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.008,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      launch('https://maps.google.com');
                                    },
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.33,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.grey[300]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Get Direction',
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Colors.blue,
                                                  fontSize: 13.sp),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01,
                                            ),
                                            Image.asset(
                                              "assets/sendd.png",
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                              color: Colors.blue,
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                MdiIcons.informationOutline,
                                color: Colors.grey[500],
                                size: MediaQuery.of(context).size.width * 0.06,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'About Business',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    'Business intro..',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                MdiIcons.link,
                                color: Colors.grey[500],
                                size: MediaQuery.of(context).size.width * 0.06,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Social accounts',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        color: Colors.grey),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        launch('https://wa.me/7874118535');
                                      },
                                      child: Image.asset(
                                        "assets/wp.png",
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
