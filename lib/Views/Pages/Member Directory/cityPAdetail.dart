import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';

import 'package:shimmer/shimmer.dart';

class PADetail extends StatefulWidget {
  const PADetail({super.key});

  @override
  State<PADetail> createState() => _PADetailState();
}

class _PADetailState extends State<PADetail> with LoadingStateMixin {
  final List<String> _paList = [
    "Growth Partner Team",
    "Event Team",
    "Finance Team",
    "Growth Associate Team",
  ];
  String _selectedList = "";
  final ScrollController _scrollController = ScrollController();

  final Map<String, GlobalKey> _sectionKeys = {
    "Growth Partner Team": GlobalKey(),
    "Event Team": GlobalKey(),
    "Finance Team": GlobalKey(),
    "Growth Associate Team": GlobalKey(),
  };

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
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: FontsColor.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "PA Chapter Name",
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
        body: SingleChildScrollView(
          controller: _scrollController,
          child: isLoading
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
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FontsColor.white,
                              border: Border.all(
                                  width: 0.2, color: FontsColor.grey),
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
                                  height: MediaQuery.of(context).size.height *
                                      0.087,
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
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.width * 0.1,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _paList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final option = _paList[index];
                                  final isSelected = _selectedList == option;

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedList = option;
                                      });
                                      Scrollable.ensureVisible(
                                        _sectionKeys[option]!.currentContext!,
                                        duration: const Duration(seconds: 1),
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? FontsColor.transparent
                                            : FontsColor.grey200,
                                        border: Border.all(
                                          width: isSelected ? 1 : 0,
                                          color: isSelected
                                              ? const Color.fromARGB(
                                                  255, 16, 2, 90)
                                              : FontsColor.transparent,
                                        ),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Center(
                                        child: Text(
                                          option,
                                          style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f13,
                                            color: isSelected
                                                ? const Color.fromARGB(
                                                    255, 16, 2, 90)
                                                : FontsColor.grey500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildSectionHeader("Growth Partner Team"),
                    buildPersonCard(
                        "Person 1 Name ", "Yoyo Fashion India Pvt Ltd"),
                    buildPersonCard("Person 2 Name ", "Saral InfoTech Pvt Ltd"),
                    buildPersonCard("Person 3 Name ", "Vatudi Fashion"),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    buildSectionHeader("Event Team"),
                    buildTeamHeadCard("Event Team Head", "Person 4 Name ",
                        "Yoyo Fashion India Pvt Ltd"),
                    buildSectionHeader("Finance Team"),
                    buildTeamHeadCard("Finance Team Head", "Person 5 Name ",
                        "Yoyo Industries Canada Pvt Ltd"),
                    buildSectionHeader("Growth Associate Team"),
                    buildTeamHeadCard("Welcome Team Head", "Person 6 Name ",
                        "Yoyo Fashion India Pvt Ltd"),
                  ],
                ),
        ),
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Container(
      key: _sectionKeys[title],
      height: MediaQuery.of(context).size.height * 0.05,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: FontsColor.grey, width: 0.2),
        color: FontsColor.grey200,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f14,
              fontWeight: FontsWeight.bold),
        ),
      ),
    );
  }

  Widget buildPersonCard(String personName, String company) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: FontsColor.grey, width: 0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.06,
                backgroundColor: FontsColor.green,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.058,
                  child: Icon(
                    Icons.person,
                    size: MediaQuery.of(context).size.width * 0.08,
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
                      personName,
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f14,
                          fontWeight: FontsWeight.bold),
                    ),
                    Text(company,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: FontsFamily.inter,
                            fontSize: FontsSize.f12,
                            color: FontsColor.grey)),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/Icons/wp.png",
                    width: MediaQuery.of(context).size.width * 0.07,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.015,
                  ),
                  Icon(
                    MdiIcons.phoneOutline,
                    color: FontsColor.grey500,
                    size: MediaQuery.of(context).size.width * 0.06,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.015,
                  ),
                  Icon(
                    MdiIcons.accountPlusOutline,
                    color: FontsColor.grey500,
                    size: MediaQuery.of(context).size.width * 0.06,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTeamHeadCard(String title, String personName, String company) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.11,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: FontsColor.grey, width: 0.2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.025,
                width: MediaQuery.of(context).size.width * 0.33,
                decoration: BoxDecoration(
                  color: FontsColor.grey200,
                  border: Border.all(width: 0.2, color: FontsColor.transparent),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f10,
                      fontWeight: FontsWeight.bold,
                      color: FontsColor.orange,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.06,
                    backgroundColor: FontsColor.blue,
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.058,
                      child: Icon(
                        Icons.person,
                        size: MediaQuery.of(context).size.width * 0.08,
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
                          personName,
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f14,
                              fontWeight: FontsWeight.bold),
                        ),
                        Text(
                          company,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f12,
                              color: FontsColor.grey),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/Icons/wp.png",
                        width: MediaQuery.of(context).size.width * 0.07,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.015,
                      ),
                      Icon(
                        MdiIcons.phoneOutline,
                        color: FontsColor.grey500,
                        size: MediaQuery.of(context).size.width * 0.06,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.015,
                      ),
                      Icon(
                        MdiIcons.accountPlusOutline,
                        color: FontsColor.grey500,
                        size: MediaQuery.of(context).size.width * 0.06,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
