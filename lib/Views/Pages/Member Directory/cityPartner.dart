import 'package:flutter/material.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:progress_alliance/Views/Components/AppBar/fullAppbar.dart';
import 'package:shimmer/shimmer.dart';

class CityPartner extends StatefulWidget {
  const CityPartner({super.key});

  @override
  State<CityPartner> createState() => _CityPartnerState();
}

class _CityPartnerState extends State<CityPartner> with LoadingStateMixin {
  final List<Map<String, String>> partners = [
    {'name': 'PA 1 KARNAVATI', 'member': '34 member'},
    {'name': 'PA 2 VARACHHA', 'member': '94 member'},
    {'name': 'PA 3 SABARMATI', 'member': '56 member'},
    {'name': 'PA 4 GOPIPURA', 'member': '78 member'},
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        appBar: CustomeAppBar(
          title: "City Name",
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
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              isLoading
                  ? Shimmer.fromColors(
                      baseColor: BgColor.grey300!,
                      highlightColor: BgColor.grey100!,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FontsColor.white,
                          border:
                              Border.all(width: 0.2, color: FontsColor.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ))
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.2,
                          color: FontsColor.grey,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "GROWTH PARTNERS (121)",
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  fontSize: FontsSize.f14,
                                  fontWeight: FontsWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.citygrowthPartnerRoute);
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
                      ),
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: partners.length,
                  itemBuilder: (context, index) {
                    return isLoading
                        ? Shimmer.fromColors(
                            baseColor: BgColor.grey300!,
                            highlightColor: BgColor.grey100!,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                color: FontsColor.white,
                                border: Border.all(
                                    width: 0.2, color: FontsColor.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ))
                        : GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.paDetailRoute);
                            },
                            child: PartnerCard(
                              name: partners[index]['name']!,
                              member: partners[index]['member']!,
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PartnerCard extends StatelessWidget {
  final String name;
  final String member;

  const PartnerCard({super.key, required this.name, required this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: FontsColor.grey,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f13,
              color: FontsColor.purple,
              fontWeight: FontsWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width * 0.27,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: FontsColor.blue50,
            ),
            child: Center(
              child: Text(
                member,
                style: TextStyle(
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f10,
                  color: FontsColor.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
