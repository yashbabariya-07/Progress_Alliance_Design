import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:progress_alliance/Views/Components/MemberDirectory/commonDesign.dart';
import 'package:progress_alliance/Views/Components/ShimmerAnimation/DirectoryShimmer/paChapterShimmer.dart';

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

  final List<Map<String, dynamic>> growthPartners = [
    {
      'section': 'Growth Partner Team',
      'partners': [
        {
          'head': 'Event Team Head',
          'name': ' Person 1 Name ',
          'company': 'Yoyo Fashion India Pvt Ltd'
        },
        {
          'head': 'Event Team Head',
          'name': ' Person 2 Name ',
          'company': 'Saral InfoTech Pvt Ltd'
        },
        {
          'head': 'Event Team Head',
          'name': ' Person 3 Name ',
          'company': 'Vatudi Fashion'
        },
      ]
    },
    {
      'section': 'Event Team',
      'partners': [
        {
          'head': 'Event Team Head',
          'name': ' Person 4 Name ',
          'company': 'Manshav Infosoft Solutions'
        },
      ]
    },
    {
      'section': 'Finance Team',
      'partners': [
        {
          'head': 'Finance Team Head',
          'name': ' Person 5 Name ',
          'company': 'Yoyo Fashion India Pvt Ltd'
        },
      ]
    },
    {
      'section': 'Growth Associate Team',
      'partners': [
        {
          'head': 'Welcome Team Head',
          'name': ' Person 6 Name ',
          'company': 'Manshav Infosoft Solutions'
        },
      ]
    },
  ];

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
              ? const PAChapterShimmer()
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
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: growthPartners.length,
                      itemBuilder: (context, index) {
                        final section = growthPartners[index];
                        return Column(
                          key: _sectionKeys[section['section']],
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TeamTitleCard(title: section['section']),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: section['partners'].length,
                              itemBuilder: (context, partnerIndex) {
                                final partner =
                                    section['partners'][partnerIndex];
                                return TeamHeadCard(
                                  title: partner['head'],
                                  personName: partner['name'],
                                  company: partner['company'],
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
