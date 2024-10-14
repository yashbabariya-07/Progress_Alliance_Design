import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:progress_alliance/Views/Components/ShimmerAnimation/HomeFieldShimmer.dart/homeShimmer.dart';
import 'package:progress_alliance/Views/Components/AppBar/homeappbar.dart';
import 'package:progress_alliance/Views/Widgets/drawer.dart';
import 'package:progress_alliance/Views/Widgets/homeBottom.dart';

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
  late NavigationHandler _navigationHandler;

  @override
  void initState() {
    super.initState();
    _navigationHandler = NavigationHandler(context);
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _navigationHandler.handleNavigation(index);
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
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.grey100,
        drawer: const PADrawer(),
        appBar: const HomeAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
          child: isLoading
              ? const HomeShimmer()
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
                                            backgroundColor: BgColor.black,
                                            child: CircleAvatar(
                                              radius: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.054,
                                              backgroundColor: BgColor.white,
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ElevatedButton(
                      onPressed: () {
                        // Test crash
                        FirebaseCrashlytics.instance.crash();

                        // Log custom error
                        try {
                          throw Exception('This is a test error');
                        } catch (e, stack) {
                          FirebaseCrashlytics.instance.recordError(e, stack);
                        }

                        // Add custom keys
                        FirebaseCrashlytics.instance
                            .setCustomKey('str_key', 'hello');
                        FirebaseCrashlytics.instance
                            .setCustomKey('bool_key', true);
                        FirebaseCrashlytics.instance.setCustomKey('int_key', 1);

                        // Add user identifier
                        FirebaseCrashlytics.instance
                            .setUserIdentifier('user123');

                        // Log messages
                        FirebaseCrashlytics.instance.log('This is a test log');
                      },
                      child: const Text('Test Crashlytics'),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ElevatedButton(
                      onPressed: () =>
                          throw const FormatException('Format Exception'),
                      child: const Text("Format Exception"),
                    ),
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
