import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactTab extends StatelessWidget {
  const ContactTab({super.key});

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
                  MdiIcons.emailOutline,
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
                      'Email Address',
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                          color: FontsColor.grey),
                    ),
                    Text(
                      'Company e-mail address',
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
                  MdiIcons.web,
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
                      'Website',
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                          color: FontsColor.grey),
                    ),
                    Text(
                      'Company website',
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
                  MdiIcons.mapMarkerOutline,
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
                      'Address',
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                          color: FontsColor.grey),
                    ),
                    Text(
                      'Company address',
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                          fontWeight: FontsWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.006,
                    ),
                    GestureDetector(
                      onTap: () {
                        launch('https://maps.google.com');
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: FontsColor.grey300),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Get Direction',
                                style: TextStyle(
                                    fontFamily: FontsFamily.inter,
                                    color: FontsColor.blue,
                                    fontSize: FontsSize.f13),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Image.asset(
                                "assets/Icons/sendd.png",
                                width: MediaQuery.of(context).size.width * 0.04,
                                color: FontsColor.blue,
                              )
                            ],
                          )),
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
                  MdiIcons.link,
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
                      'Social Media Link',
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                          color: FontsColor.grey),
                    ),
                    GestureDetector(
                        onTap: () {
                          launch('https://wa.me/7874118535');
                        },
                        child: Image.asset(
                          "assets/Icons/wp.png",
                          width: MediaQuery.of(context).size.width * 0.08,
                        )),
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
