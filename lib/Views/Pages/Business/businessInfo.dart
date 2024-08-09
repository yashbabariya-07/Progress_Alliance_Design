import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:progress_alliance/Views/Widgets/bottombar.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:shimmer/shimmer.dart';

class Businessinfo extends StatefulWidget {
  final String name;
  final String type;
  final String category;
  final String subCategory;
  final String product;
  final String gstNo;
  final String number;
  final String email;
  final String website;
  final String teamSize;
  final String formation;
  final String establish;
  final String about;
  final File? logoImage;
  final File? bannerImage;
  final String shopNumber;
  final String streetName;
  final String area;
  final String landmark;
  final String pincode;
  final String state;
  final String city;
  final String facebook;
  final String linkedin;
  final String instagram;
  final String youtube;
  final String google;

  const Businessinfo({
    super.key,
    required this.name,
    required this.type,
    required this.category,
    required this.subCategory,
    required this.product,
    required this.gstNo,
    required this.number,
    required this.email,
    required this.website,
    required this.teamSize,
    required this.formation,
    required this.establish,
    required this.about,
    this.logoImage,
    this.bannerImage,
    required this.shopNumber,
    required this.streetName,
    required this.area,
    required this.landmark,
    required this.pincode,
    required this.state,
    required this.city,
    required this.facebook,
    required this.linkedin,
    required this.instagram,
    required this.youtube,
    required this.google,
  });

  @override
  State<Businessinfo> createState() => _BusinessinfoState();
}

class _BusinessinfoState extends State<Businessinfo> with LoadingStateMixin {
  File? _logoImage;
  int _selectedIndex = 1;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, Routes.profileRoute);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, Routes.businessRoute);
        break;
      default:
        break;
    }
  }

  Future<void> _picklogoImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _logoImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: FontsColor.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          backgroundColor: FontsColor.white,
          forceMaterialTransparency: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              color: FontsColor.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Business Information",
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f16,
              color: FontsColor.purple,
              fontWeight: FontsWeight.bold,
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
                onPressed: () {
                  Navigator.pushNamed(context, Routes.profileRoute);
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: MediaQuery.of(context).size.width * 0.06,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: isLoading
                ? Shimmer.fromColors(
                    baseColor: FontsColor.grey300!,
                    highlightColor: FontsColor.grey100!,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.32,
                              height: MediaQuery.of(context).size.height * 0.15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: FontsColor.grey200),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.75,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: FontsColor.grey200),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.012,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.11,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: FontsColor.grey200),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.012,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.09,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: FontsColor.grey200),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              alignment: Alignment.centerRight,
                              height: MediaQuery.of(context).size.width * 0.1,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: FontsColor.grey200),
                            ),
                          ),
                        ]))
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: _picklogoImage,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.32,
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: FontsColor.grey200,
                                  ),
                                  child: _logoImage != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.file(
                                            _logoImage!,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Center(
                                          child: Text(
                                            "+ Add",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: FontsFamily.inter,
                                              fontSize: FontsSize.f15,
                                              color: FontsColor.grey600,
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 0.2, color: FontsColor.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Business Details",
                                          style: TextStyle(
                                              fontFamily: FontsFamily.inter,
                                              fontSize: FontsSize.f15,
                                              color: const Color.fromARGB(
                                                  255, 16, 2, 90),
                                              fontWeight: FontsWeight.bold),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  Routes.businessDetailRoute);
                                            },
                                            child: CircleAvatar(
                                              radius: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                              backgroundColor:
                                                  FontsColor.grey300,
                                              child: Center(
                                                child: Icon(
                                                  MdiIcons.pencilOutline,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.045,
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Text("Company Name",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.006,
                                    ),
                                    Text(
                                      widget.name,
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.012,
                                    ),
                                    Text("Business Type",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.006,
                                    ),
                                    Text(
                                      widget.type,
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.012,
                                    ),
                                    Text("Business Category",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.006,
                                    ),
                                    Text(
                                      widget.category,
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.012,
                                    ),
                                    Text("Business Sub Category",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.006,
                                    ),
                                    Text(
                                      widget.subCategory,
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.012,
                                    ),
                                    Text("Products/Service",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.006,
                                    ),
                                    Text(
                                      widget.product,
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.012,
                                    ),
                                    Text("GST Number",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.006,
                                    ),
                                    Text(
                                      widget.gstNo,
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.012,
                                    ),
                                    Text("Contact Number",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.006,
                                    ),
                                    Text(
                                      widget.number,
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.012,
                                    ),
                                    Text("Email Address",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.006,
                                    ),
                                    Text(
                                      widget.email,
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.012,
                                    ),
                                    Text("Website",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.006,
                                    ),
                                    Text(
                                      widget.website,
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.012,
                                    ),
                                    Text("Team Size",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.006,
                                    ),
                                    Text(
                                      widget.teamSize,
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.012,
                                    ),
                                    Text("Business Formation",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.006,
                                    ),
                                    Text(
                                      widget.formation,
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.012,
                                    ),
                                    Text("Business established Date",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.006,
                                    ),
                                    Text(
                                      widget.establish,
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.012,
                                    ),
                                    Text("About Business",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.006,
                                    ),
                                    Text(
                                      widget.about,
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.012,
                                    ),
                                    if (widget.logoImage != null)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Logo",
                                              style: TextStyle(
                                                  fontFamily: FontsFamily.inter,
                                                  fontSize: FontsSize.f12,
                                                  color: FontsColor.grey)),
                                          const SizedBox(height: 5),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.25,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: FileImage(
                                                    widget.logoImage!),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.012,
                                    ),
                                    if (widget.bannerImage != null)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Banner",
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f11,
                                                color: FontsColor.grey),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.4,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: FileImage(
                                                    widget.bannerImage!),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.012,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 0.2, color: FontsColor.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Business Address",
                                          style: TextStyle(
                                              fontFamily: FontsFamily.inter,
                                              fontSize: FontsSize.f15,
                                              color: const Color.fromARGB(
                                                  255, 16, 2, 90),
                                              fontWeight: FontsWeight.bold),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  Routes.businessAddressRoute);
                                            },
                                            child: CircleAvatar(
                                              radius: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                              backgroundColor:
                                                  FontsColor.grey300,
                                              child: Center(
                                                child: Icon(
                                                  MdiIcons.pencilOutline,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.045,
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Text("Address",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.006,
                                    ),
                                    Text(
                                      "${widget.shopNumber} ${widget.streetName} ${widget.area} ${widget.landmark} ${widget.city} ${widget.state}  ${widget.pincode} ",
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.012,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 0.2, color: FontsColor.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Social Account",
                                          style: TextStyle(
                                              fontFamily: FontsFamily.inter,
                                              fontSize: FontsSize.f15,
                                              color: const Color.fromARGB(
                                                  255, 16, 2, 90),
                                              fontWeight: FontsWeight.bold),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  Routes.socialAccountRoute);
                                            },
                                            child: CircleAvatar(
                                              radius: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                              backgroundColor:
                                                  FontsColor.grey300,
                                              child: Center(
                                                child: Icon(
                                                  MdiIcons.pencilOutline,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.045,
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.red[50],
                              ),
                              height: MediaQuery.of(context).size.width * 0.1,
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    MdiIcons.deleteOutline,
                                    color: Colors.red,
                                    size: MediaQuery.of(context).size.width *
                                        0.065,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.006,
                                  ),
                                  Text(
                                    "Delete Business",
                                    style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f13,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
    );
  }
}
