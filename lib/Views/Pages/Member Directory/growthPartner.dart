import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:url_launcher/url_launcher.dart';

class Growthpartner extends StatefulWidget {
  const Growthpartner({Key? key}) : super(key: key);

  @override
  State<Growthpartner> createState() => _GrowthpartnerState();
}

class _GrowthpartnerState extends State<Growthpartner> {
  List<Map<String, dynamic>> items = [
    {
      "type": "Circle Growth Partner",
      "name": "Your Name 1",
      "business": "Business Name 1",
      "actions": ["message", "call"]
    },
    {
      "type": "Program Growth Partner",
      "name": "Your Name 2",
      "business": "Business Name 2",
      "actions": ["message", "call"]
    },
    {
      "type": "Universal Growth Partner",
      "name": "Your Name 3",
      "business": "Business Name 3",
      "actions": ["message", "call"]
    },
    {
      "type": "Cluster Growth Partner",
      "name": "Your Name 4",
      "business": "Business Name 4",
      "actions": ["message", "call"]
    },
    {
      "type": "Circle Growth Partner",
      "name": "Your Name 5",
      "business": "Business Name 5",
      "actions": ["message", "call"]
    },
  ];

  Color _getContainerColor(String type) {
    switch (type) {
      case "Circle Growth Partner":
        return FontsColor.lightblue;
      case "Program Growth Partner":
        return FontsColor.lightred;
      case "Universal Growth Partner":
        return FontsColor.lightblack;
      case "Cluster Growth Partner":
        return FontsColor.lightgreen;
      default:
        return FontsColor.white;
    }
  }

  Color _getTextColor(String type) {
    switch (type) {
      case "Circle Growth Partner":
        return FontsColor.blue;
      case "Program Growth Partner":
        return Colors.red;
      case "Universal Growth Partner":
        return FontsColor.black;
      case "Cluster Growth Partner":
        return FontsColor.green;
      default:
        return FontsColor.black;
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
          backgroundColor: FontsColor.white,
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
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
            "Cluster Growth Partner",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
                Icons.search,
                size: MediaQuery.of(context).size.width * 0.06,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                MdiIcons.downloadOutline,
                size: MediaQuery.of(context).size.width * 0.06,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.87,
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              String type = items[index]['type'];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.memberDetailRoute);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 0.5, color: FontsColor.grey),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.03,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          color: _getContainerColor(type),
                        ),
                        child: Center(
                          child: Text(
                            type,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f12,
                              fontWeight: FontsWeight.bold,
                              color: _getTextColor(type),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.08,
                          child: Icon(
                            Icons.person,
                            size: MediaQuery.of(context).size.width * 0.09,
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        items[index]['name'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                          fontWeight: FontsWeight.bold,
                        ),
                      ),
                      Text(
                        items[index]['business'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: FontsFamily.inter,
                            fontSize: FontsSize.f13,
                            color: FontsColor.grey),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.006,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              launch('https://wa.me/7874118535');
                            },
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.045,
                              backgroundColor: FontsColor.grey200,
                              child: Image.asset(
                                "assets/Icons/wp.png",
                                width:
                                    MediaQuery.of(context).size.width * 0.065,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.025,
                          ),
                          GestureDetector(
                            onTap: () async {
                              const phoneNumber = 'tel:7874118535';
                              if (await canLaunch(phoneNumber)) {
                                await launch(phoneNumber);
                              } else {
                                throw 'Could not launch $phoneNumber';
                              }
                            },
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.045,
                              backgroundColor: FontsColor.grey200,
                              child: Icon(
                                MdiIcons.phoneOutline,
                                size: MediaQuery.of(context).size.width * 0.05,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
