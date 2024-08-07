import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:progress_alliance/Views/Widgets/homeBottom.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with LoadingStateMixin {
  int _current = 0;
  final List<String> imgList = [
    'assets/Images/s1.jpg',
    'assets/Images/s1.jpg',
    'assets/Images/s1.jpg',
  ];

  int _selectedIndex = 0;
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

  List<Map<String, dynamic>> leads = [
    {
      "name": "John Doe",
      "company": "Vasudev Infotech Solution",
      "domain": "IT & Software",
      "profile": "Software Development",
      "needs": "Software Developer"
    },
    {
      "name": "Jane Smith",
      "company": "Tech Solutions",
      "domain": "IT & Software",
      "profile": "Software Development",
      "needs": "Business Executive"
    },
    {
      "name": "Axar Patel",
      "company": "OTexh Solutions",
      "domain": "IT & Software",
      "profile": "Software Development",
      "needs": "UI/UX Designer"
    },
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: FontsColor.grey100,
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.64,
          child: Drawer(
            backgroundColor: FontsColor.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Column(
                children: [
                  Image.asset(
                    "assets/Logo/PA.png",
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
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          backgroundColor: FontsColor.white,
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Image.asset(
                "assets/Icons/dr.png",
                color: FontsColor.purple,
                width: MediaQuery.of(context).size.width * 0.07,
              ),
            ),
          ),
          titleSpacing: 0,
          title: Row(
            children: [
              isLoading
                  ? Shimmer.fromColors(
                      baseColor: FontsColor.grey300!,
                      highlightColor: FontsColor.grey100!,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.045,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.profileRoute);
                      },
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.045,
                        child: Icon(
                          Icons.person,
                          size: MediaQuery.of(context).size.width * 0.07,
                        ),
                      ),
                    ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Expanded(
                child: Text(
                  "Hii, John Doe",
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: FontsFamily.inter,
                    fontSize: FontsSize.f15,
                    fontWeight: FontsWeight.bold,
                    color: FontsColor.purple,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                size: MediaQuery.of(context).size.width * 0.06,
                color: FontsColor.purple,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.homeSearchRoute);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.qr_code,
                size: MediaQuery.of(context).size.width * 0.06,
                color: FontsColor.purple,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.qrRoute);
              },
            ),
            IconButton(
              icon: Icon(
                MdiIcons.bellOutline,
                color: FontsColor.purple,
                size: MediaQuery.of(context).size.width * 0.06,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.notificationRoute);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
          child: isLoading
              ? Shimmer.fromColors(
                  baseColor: FontsColor.grey300!,
                  highlightColor: FontsColor.grey100!,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                        items: imgList
                            .map((item) => Container(
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      child: Image.asset(
                                        item,
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.008,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  aspectRatio: 2.0,
                                  initialPage: entry.key,
                                ),
                                items: imgList
                                    .map((item) => Container(
                                          child: Center(
                                            child: Image.asset(
                                              item,
                                              fit: BoxFit.cover,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                            ),
                                          ),
                                        ))
                                    .toList()),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.025,
                              height: MediaQuery.of(context).size.width * 0.025,
                              margin: EdgeInsets.symmetric(horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? FontsColor.white
                                        : FontsColor.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                            width: MediaQuery.of(context).size.width * 0.24,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: FontsColor.grey200),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                            width: MediaQuery.of(context).size.width * 0.24,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: FontsColor.grey200),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.detailPersonRoute);
                          },
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.22,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: leads.length,
                              itemBuilder: (context, index) {
                                final lead = leads[index];
                                DateTime now = DateTime.now();
                                String formattedDate =
                                    DateFormat('dd MMM').format(now);
                                return Container(
                                  margin: const EdgeInsets.all(5),
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: FontsColor.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(formattedDate,
                                                style: TextStyle(
                                                    fontFamily:
                                                        FontsFamily.inter,
                                                    fontSize: FontsSize.f12,
                                                    color: FontsColor.black)),
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: FontsColor.green,
                                              ),
                                              child: Center(
                                                child: Text("Inquiry",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            FontsFamily.inter,
                                                        fontSize: FontsSize.f12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            FontsColor.white)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.012),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.055,
                                              backgroundColor: FontsColor.black,
                                              child: CircleAvatar(
                                                radius: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.054,
                                                backgroundColor:
                                                    FontsColor.white,
                                                child: Icon(
                                                  Icons.person,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.07,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(lead['name'],
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          FontsFamily.inter,
                                                      fontSize: FontsSize.f12,
                                                      color: FontsColor.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                Text(lead['company'],
                                                    style: TextStyle(
                                                        fontFamily:
                                                            FontsFamily.inter,
                                                        fontSize: FontsSize.f11,
                                                        color:
                                                            FontsColor.grey)),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.012),
                                        Text(lead['domain'],
                                            style: TextStyle(
                                              fontFamily: FontsFamily.inter,
                                              fontSize: FontsSize.f12,
                                              color: FontsColor.black,
                                              fontWeight: FontsWeight.bold,
                                            )),
                                        Text(lead['profile'],
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f12,
                                                color: FontsColor.grey600)),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: "Member Needs : ",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          FontsFamily.inter,
                                                      fontSize: FontsSize.f12,
                                                      color:
                                                          FontsColor.grey400)),
                                              TextSpan(
                                                  text: lead['needs'],
                                                  style: TextStyle(
                                                      fontFamily:
                                                          FontsFamily.inter,
                                                      fontSize: FontsSize.f12,
                                                      color:
                                                          FontsColor.grey800)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
                    ],
                  ))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: imgList
                          .map((item) => Center(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  child: Image.asset(
                                    item,
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.008,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: true,
                                aspectRatio: 2.0,
                                initialPage: entry.key,
                              ),
                              items: imgList
                                  .map((item) => Center(
                                        child: Image.asset(
                                          item,
                                          fit: BoxFit.cover,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                      ))
                                  .toList()),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.025,
                            height: MediaQuery.of(context).size.width * 0.025,
                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? FontsColor.white
                                      : FontsColor.black)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Leads",
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f14,
                              fontWeight: FontsWeight.bold),
                        ),
                        Text(
                          "View All",
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              color: FontsColor.grey,
                              fontWeight: FontsWeight.bold,
                              fontSize: FontsSize.f14),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.detailPersonRoute);
                        },
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: leads.length,
                            itemBuilder: (context, index) {
                              final lead = leads[index];
                              DateTime now = DateTime.now();
                              String formattedDate =
                                  DateFormat('dd MMM').format(now);
                              return Container(
                                margin: const EdgeInsets.all(5),
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.85,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: FontsColor.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(formattedDate,
                                              style: TextStyle(
                                                  fontFamily: FontsFamily.inter,
                                                  fontSize: FontsSize.f12,
                                                  color: FontsColor.black)),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: FontsColor.green,
                                            ),
                                            child: Center(
                                              child: Text("Inquiry",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          FontsFamily.inter,
                                                      fontSize: FontsSize.f12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: FontsColor.white)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.012),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.055,
                                            backgroundColor: FontsColor.black,
                                            child: CircleAvatar(
                                              radius: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.054,
                                              backgroundColor: FontsColor.white,
                                              child: Icon(
                                                Icons.person,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.07,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(lead['name'],
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        FontsFamily.inter,
                                                    fontSize: FontsSize.f12,
                                                    color: FontsColor.black,
                                                    fontWeight:
                                                        FontsWeight.bold,
                                                  )),
                                              Text(
                                                lead['company'],
                                                style: TextStyle(
                                                    fontFamily:
                                                        FontsFamily.inter,
                                                    fontSize: FontsSize.f11,
                                                    color: FontsColor.grey),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.012),
                                      Text(lead['domain'],
                                          style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.black,
                                            fontWeight: FontsWeight.bold,
                                          )),
                                      Text(lead['profile'],
                                          style: TextStyle(
                                              fontFamily: FontsFamily.inter,
                                              fontSize: FontsSize.f12,
                                              color: FontsColor.grey600)),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "Member Needs : ",
                                                style: TextStyle(
                                                    fontFamily:
                                                        FontsFamily.inter,
                                                    fontSize: FontsSize.f12,
                                                    color: FontsColor.grey400)),
                                            TextSpan(
                                                text: lead['needs'],
                                                style: TextStyle(
                                                    fontFamily:
                                                        FontsFamily.inter,
                                                    fontSize: FontsSize.f12,
                                                    color: FontsColor.grey800)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )),
                  ],
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
