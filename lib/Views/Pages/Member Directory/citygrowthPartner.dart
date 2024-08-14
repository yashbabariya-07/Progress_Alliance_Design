import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:progress_alliance/Views/Components/MemberDirectory/commonDesign.dart';
import 'package:progress_alliance/Views/Components/ShimmerAnimation/DirectoryShimmer/growthShimmer.dart';
import 'package:progress_alliance/Views/Components/userTextField.dart/customeTextFormField.dart';

class CityGrowthPartner extends StatefulWidget {
  const CityGrowthPartner({super.key});

  @override
  State<CityGrowthPartner> createState() => _CityGrowthPartnerState();
}

class _CityGrowthPartnerState extends State<CityGrowthPartner>
    with LoadingStateMixin {
  final TextEditingController _SearchController = TextEditingController();
  final List<Map<String, dynamic>> growthPartners = [
    {
      'section': 'PA 1 ARJUN',
      'partners': [
        {'name': ' Person 1 Name ', 'company': 'Yoyo Fashion India Pvt Ltd'},
        {'name': ' Person 2 Name ', 'company': 'Saral InfoTech Pvt Ltd'},
      ]
    },
    {
      'section': 'PA 2 LAKSHYA',
      'partners': [
        {'name': ' Person 3 Name ', 'company': 'Manshav Infosoft Solutions'},
        {'name': ' Person 4 Name ', 'company': 'Perfect Door And Window'},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        appBar: AppBar(
          backgroundColor: BgColor.white,
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
            ? const GrowthShimmer()
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: CustomeSearchField(
                      hintText: 'Search by name, company and chapter...',
                      controller: _SearchController,
                      onChange: (value) {},
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: growthPartners.length,
                      itemBuilder: (context, index) {
                        final section = growthPartners[index];
                        return Column(
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
                                return PersonCard(
                                  title: partner['name'],
                                  cname: partner['company'],
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
