import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:progress_alliance/Views/Components/ShimmerAnimation/DirectoryShimmer/directoryShimmer.dart';
import 'package:progress_alliance/Views/Widgets/homeBottom.dart';
import 'package:progress_alliance/Routes/route.dart';

class MemberDirectory extends StatefulWidget {
  const MemberDirectory({Key? key}) : super(key: key);

  @override
  State<MemberDirectory> createState() => _MemberDirectoryState();
}

class _MemberDirectoryState extends State<MemberDirectory>
    with LoadingStateMixin {
  List<Map<String, String>> cities = [
    {"image": "assets/Images/surat.jpg", "label": "Ahemdabad"},
    {"image": "assets/Images/surat.jpg", "label": "Ankleshwar"},
    {"image": "assets/Images/surat.jpg", "label": "Bhavnagar"},
    {"image": "assets/Images/surat.jpg", "label": "Jetpur"},
    {"image": "assets/Images/surat.jpg", "label": "Nashik"},
    {"image": "assets/Images/surat.jpg", "label": "Navsari"},
    {"image": "assets/Images/surat.jpg", "label": "Rajkot"},
    {"image": "assets/Images/surat.jpg", "label": "Surat"},
    {"image": "assets/Images/surat.jpg", "label": "Universal"},
    {"image": "assets/Images/surat.jpg", "label": "Vadodara"},
    {"image": "assets/Images/surat.jpg", "label": "Vapi"},
  ];

  int _selectedIndex = 3;
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
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: FontsColor.white,
        appBar: AppBar(
          backgroundColor: FontsColor.white,
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: FontsColor.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Member Directory",
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
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: isLoading
              ? const DirectoryShimmer()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 0.2, color: FontsColor.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Cluster Growth Partner",
                                  style: TextStyle(
                                      fontFamily: FontsFamily.inter,
                                      fontSize: FontsSize.f15,
                                      fontWeight: FontsWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.growthPartnerRoute);
                                  },
                                  child: Text(
                                    "View All >",
                                    style: TextStyle(
                                      fontFamily: FontsFamily.inter,
                                      fontSize: FontsSize.f14,
                                      color: FontsColor.blue,
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
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const Divider(thickness: 0.5),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Text(
                      "Cities",
                      style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f15,
                        fontWeight: FontsWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 8,
                                childAspectRatio: 0.8),
                        itemCount: cities.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.cityDetailRoute);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: FontsColor.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: MediaQuery.of(context).size.width *
                                        0.099,
                                    backgroundColor: FontsColor.white,
                                    child: CircleAvatar(
                                      radius:
                                          MediaQuery.of(context).size.width *
                                              0.097,
                                      backgroundImage:
                                          AssetImage(cities[index]['image']!),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Text(
                                cities[index]['label']!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  fontSize: FontsSize.f12,
                                  fontWeight: FontsWeight.bold,
                                  color: FontsColor.purple,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
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
