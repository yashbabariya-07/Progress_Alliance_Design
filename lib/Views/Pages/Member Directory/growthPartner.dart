import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Routes/route.dart';
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
        return const Color.fromARGB(255, 175, 205, 230);
      case "Program Growth Partner":
        return const Color.fromARGB(255, 255, 205, 205);
      case "Universal Growth Partner":
        return const Color.fromARGB(255, 220, 220, 220);
      case "Cluster Growth Partner":
        return const Color.fromARGB(255, 205, 255, 205);
      default:
        return Colors.white;
    }
  }

  Color _getTextColor(String type) {
    switch (type) {
      case "Circle Growth Partner":
        return Colors.blue;
      case "Program Growth Partner":
        return Colors.red;
      case "Universal Growth Partner":
        return Colors.black;
      case "Cluster Growth Partner":
        return Colors.green;
      default:
        return Colors.black;
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
            "Cluster Growth Partner",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
                    border: Border.all(width: 0.5, color: Colors.grey),
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
                              fontFamily: 'Inter',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
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
                          fontFamily: 'Inter',
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        items[index]['business'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13.sp,
                            color: Colors.grey),
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
                              backgroundColor: Colors.grey[200],
                              child: Image.asset(
                                "assets/wp.png",
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
                              backgroundColor: Colors.grey[200],
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
