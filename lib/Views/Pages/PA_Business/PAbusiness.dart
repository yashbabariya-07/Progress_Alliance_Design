import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Widgets/homeBottom.dart';
import 'package:progress_alliance/Routes/route.dart';

class Pabusiness extends StatefulWidget {
  const Pabusiness({super.key});

  @override
  State<Pabusiness> createState() => _PabusinessState();
}

class _PabusinessState extends State<Pabusiness> {
  final List<Map<String, String>> businessCategories = [
    {
      "title": "Advertising Services",
      "subtitle": "84 Companies",
      "image": "assets/surat.jpg"
    },
    {
      "title": "Agriculture & Agro",
      "subtitle": "50 Companies",
      "image": "assets/map.png"
    },
    {
      "title": "Automobile",
      "subtitle": "20 Companies",
      "image": "assets/surat.jpg"
    },
    {
      "title": "Beauty Care & Cosmetic",
      "subtitle": "20 Companies",
      "image": "assets/map.png"
    },
    {
      "title": "Chemicals",
      "subtitle": "20 Companies",
      "image": "assets/surat.jpg"
    },
  ];

  final List<Map<String, String>> industries = [
    {"name": "Industry 1", "image": "assets/surat.jpg"},
    {"name": "Industry 2", "image": "assets/map.png"},
    {"name": "Industry 3", "image": "assets/surat.jpg"},
    {"name": "Industry 4", "image": "assets/map.png"},
    {"name": "Industry 5", "image": "assets/surat.jpg"},
  ];

  int _selectedIndex = 1;
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, Routes.paBusinessRoute);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, Routes.googleMapRoute);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, Routes.memberRoute);
        break;
      default:
        break;
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
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Image.asset(
                "assets/dr.png",
                color: FontsColor.purple,
                width: MediaQuery.of(context).size.width * 0.07,
              ),
            ),
          ),
          titleSpacing: 0,
          title: Text(
            "PA Business",
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f16,
              color: FontsColor.purple,
              fontWeight: FontsWeight.bold,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              color: FontsColor.grey,
              height: 0.2,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: FontsColor.purple,
                  size: MediaQuery.of(context).size.width * 0.06,
                ))
          ],
        ),
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.64,
          child: Drawer(
            backgroundColor: FontsColor.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Column(
                children: [
                  Image.asset(
                    "assets/PA.png",
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  const Divider(thickness: 0.5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.note_add_outlined,
                              color: FontsColor.black,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            title: Text(
                              "Complaint",
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  fontSize: FontsSize.f14,
                                  fontWeight: FontsWeight.bold),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.ComplaintRoute);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              MdiIcons.downloadCircleOutline,
                              color: FontsColor.black,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            title: Text(
                              "Downloads",
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  fontSize: FontsSize.f14,
                                  fontWeight: FontsWeight.bold),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.downloadRoute);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.feedback_outlined,
                              color: FontsColor.black,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            title: Text(
                              "Feedback & Review",
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  fontSize: FontsSize.f14,
                                  fontWeight: FontsWeight.bold),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.feedbackRoute);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.contact_mail,
                              color: FontsColor.black,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            title: Text(
                              "Contact Us",
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  fontSize: FontsSize.f14,
                                  fontWeight: FontsWeight.bold),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, Routes.contactRoute);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              MdiIcons.informationOutline,
                              color: FontsColor.black,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            title: Text(
                              "About Us",
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  fontSize: FontsSize.f14,
                                  fontWeight: FontsWeight.bold),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              MdiIcons.helpCircleOutline,
                              color: FontsColor.black,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            title: Text(
                              "Help?",
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  fontSize: FontsSize.f14,
                                  fontWeight: FontsWeight.bold),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.red[50],
                      ),
                      height: MediaQuery.of(context).size.width * 0.1,
                      width: MediaQuery.of(context).size.width * 0.32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            MdiIcons.power,
                            color: Colors.red,
                            size: MediaQuery.of(context).size.width * 0.06,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.009),
                          Text(
                            "LOG OUT",
                            style: TextStyle(
                                fontFamily: FontsFamily.inter,
                                fontSize: FontsSize.f13,
                                fontWeight: FontsWeight.bold,
                                color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Business Category",
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f15,
                          color: Color.fromARGB(255, 16, 2, 90),
                          fontWeight: FontsWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.industrieRoute);
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                            fontFamily: FontsFamily.inter,
                            fontSize: FontsSize.f13,
                            color: FontsColor.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2 / 1,
                  ),
                  itemCount: businessCategories.length,
                  itemBuilder: (context, index) {
                    final item = businessCategories[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.ServiceRoute);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.2, color: FontsColor.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 4,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                                child: Image.asset(
                                  item["image"]!,
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 6,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item["title"]!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f12,
                                        color: FontsColor.black,
                                        fontWeight: FontsWeight.bold,
                                      ),
                                    ),
                                    Text(item["subtitle"]!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.grey)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.018,
                ),
                Text(
                  "Find Industries",
                  style: TextStyle(
                    fontFamily: FontsFamily.inter,
                    fontSize: FontsSize.f15,
                    color: Color.fromARGB(255, 16, 2, 90),
                    fontWeight: FontsWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.012,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: industries.length,
                    itemBuilder: (context, index) {
                      final industry = industries[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.industrieRoute);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.height * 0.15,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(industry["image"]!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                    child: Container(
                                        color: FontsColor.transparent),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 3,
                                right: 3,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      industry["name"]!,
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                        color: FontsColor.white,
                                        fontWeight: FontsWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: FontsColor.transparent),
            borderRadius: BorderRadius.circular(25),
          ),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.askRoute);
            },
            backgroundColor: Color.fromARGB(255, 16, 2, 90),
            child: Text(
              "+ Add Ask",
              style: TextStyle(
                fontFamily: FontsFamily.inter,
                fontSize: FontsSize.f13,
                color: FontsColor.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        bottomNavigationBar: HomeBottom(
          selectedIndex: _selectedIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
    );
  }
}
