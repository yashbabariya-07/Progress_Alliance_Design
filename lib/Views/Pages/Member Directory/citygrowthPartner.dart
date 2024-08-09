import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';

import 'package:shimmer/shimmer.dart';

class CityGrowthPartner extends StatefulWidget {
  const CityGrowthPartner({super.key});

  @override
  State<CityGrowthPartner> createState() => _CityGrowthPartnerState();
}

class _CityGrowthPartnerState extends State<CityGrowthPartner>
    with LoadingStateMixin {
  final TextEditingController _SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: FontsColor.white,
        appBar: AppBar(
          backgroundColor: FontsColor.white,
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              color: FontsColor.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Growth Partner",
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
              icon: Icon(
                MdiIcons.downloadOutline,
                size: MediaQuery.of(context).size.width * 0.06,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: isLoading
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Shimmer.fromColors(
                  baseColor: FontsColor.grey300!,
                  highlightColor: FontsColor.grey100!,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.055,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FontsColor.white,
                            border:
                                Border.all(width: 0.2, color: FontsColor.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 6,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2.5, horizontal: 15),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.087,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FontsColor.white,
                                  border: Border.all(
                                      width: 0.2, color: FontsColor.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.055,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: FontsColor.grey, width: 0.2),
                      ),
                      child: TextFormField(
                        controller: _SearchController,
                        decoration: InputDecoration(
                          labelText: 'Search by name, company and chapter...',
                          labelStyle: TextStyle(
                              fontSize: FontsSize.f14,
                              fontFamily: FontsFamily.inter,
                              color: FontsColor.grey700),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: FontsColor.orange,
                            size: MediaQuery.of(context).size.width * 0.06,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: double.infinity,
                    color: FontsColor.grey200,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "PA 1 ARJUN",
                        style: TextStyle(
                            fontFamily: FontsFamily.inter,
                            fontSize: FontsSize.f14,
                            fontWeight: FontsWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.2,
                          color: FontsColor.grey,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.06,
                              backgroundColor: FontsColor.green,
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.058,
                                child: Icon(
                                  Icons.person,
                                  size:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Person 1 Name ",
                                    style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                        fontWeight: FontsWeight.bold),
                                  ),
                                  Flexible(
                                    child: Text("Yoyo Fashion India Pvt Ltd",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/wp.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.015,
                                ),
                                Icon(
                                  MdiIcons.phoneOutline,
                                  color: FontsColor.grey500,
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.015,
                                ),
                                Icon(
                                  MdiIcons.accountPlusOutline,
                                  color: FontsColor.grey500,
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.2,
                          color: FontsColor.grey,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.06,
                              backgroundColor: FontsColor.blue,
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.058,
                                child: Icon(
                                  Icons.person,
                                  size:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Person 2 Name ",
                                    style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                        fontWeight: FontsWeight.bold),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Saral InfoTech Pvt Ltd",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f12,
                                          color: FontsColor.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/wp.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.015,
                                ),
                                Icon(
                                  MdiIcons.phoneOutline,
                                  color: FontsColor.grey500,
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.015,
                                ),
                                Icon(
                                  MdiIcons.accountPlusOutline,
                                  color: FontsColor.grey500,
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: double.infinity,
                    color: FontsColor.grey200,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "PA 2 LAKSHYA",
                        style: TextStyle(
                            fontFamily: FontsFamily.inter,
                            fontSize: FontsSize.f14,
                            fontWeight: FontsWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.2,
                          color: FontsColor.grey,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.06,
                              backgroundColor: FontsColor.green,
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.058,
                                child: Icon(
                                  Icons.person,
                                  size:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Person 3 Name ",
                                    style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                        fontWeight: FontsWeight.bold),
                                  ),
                                  Flexible(
                                    child: Text("Manshav Infosoft Solution",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/wp.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.015,
                                ),
                                Icon(
                                  MdiIcons.phoneOutline,
                                  color: FontsColor.grey500,
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.015,
                                ),
                                Icon(
                                  MdiIcons.accountPlusOutline,
                                  color: FontsColor.grey500,
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.2,
                          color: FontsColor.grey,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.06,
                              backgroundColor: FontsColor.blue,
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.058,
                                child: Icon(
                                  Icons.person,
                                  size:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Person 4 Name ",
                                    style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                        fontWeight: FontsWeight.bold),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Perfect Door And Window",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f12,
                                          color: FontsColor.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/wp.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.015,
                                ),
                                Icon(
                                  MdiIcons.phoneOutline,
                                  color: FontsColor.grey500,
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.015,
                                ),
                                Icon(
                                  MdiIcons.accountPlusOutline,
                                  color: FontsColor.grey500,
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
