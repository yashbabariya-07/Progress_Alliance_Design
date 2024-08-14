import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  MdiIcons.accountOutline,
                  color: FontsColor.grey500,
                  size: MediaQuery.of(context).size.width * 0.06,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Person',
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                          color: FontsColor.grey),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.835,
                      child: ListTile(
                          leading: CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.05,
                            child: Icon(
                              Icons.person,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                          ),
                          title: Text(
                            'Person Name',
                            style: TextStyle(
                                fontFamily: FontsFamily.inter,
                                fontSize: FontsSize.f13,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Person PA Details',
                            style: TextStyle(
                                fontFamily: FontsFamily.inter,
                                fontSize: FontsSize.f13,
                                fontWeight: FontWeight.bold,
                                color: FontsColor.grey),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: MediaQuery.of(context).size.width * 0.05,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Routes.memberDetailRoute);
                            },
                          )),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  MdiIcons.viewAgendaOutline,
                  color: FontsColor.grey500,
                  size: MediaQuery.of(context).size.width * 0.06,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                          color: FontsColor.grey),
                    ),
                    Text(
                      'Company Category',
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                          fontWeight: FontsWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  MdiIcons.viewAgendaOutline,
                  color: FontsColor.grey500,
                  size: MediaQuery.of(context).size.width * 0.06,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Sub Category',
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                          color: FontsColor.grey),
                    ),
                    Text(
                      'Company Sub Category',
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                          fontWeight: FontsWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  MdiIcons.hexagonOutline,
                  color: FontsColor.grey500,
                  size: MediaQuery.of(context).size.width * 0.06,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Formation',
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                          color: FontsColor.grey),
                    ),
                    Text(
                      'Company Formation',
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                          fontWeight: FontsWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  MdiIcons.shoppingOutline,
                  color: FontsColor.grey500,
                  size: MediaQuery.of(context).size.width * 0.06,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Product & Services',
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                          color: FontsColor.grey),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: FontsColor.grey300),
                      child: Center(
                        child: Text('Company Product',
                            style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f13,
                              fontWeight: FontsWeight.bold,
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  MdiIcons.informationOutline,
                  color: FontsColor.grey500,
                  size: MediaQuery.of(context).size.width * 0.06,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'About Us',
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                          color: FontsColor.grey),
                    ),
                    Text(
                      'Company Intro...',
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                          fontWeight: FontsWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
