import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
            preferredSize: Size.fromHeight(0),
            child: Container(
              color: FontsColor.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Contact Us",
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Information",
                    style: TextStyle(
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f16,
                      color: FontsColor.purple,
                      fontWeight: FontsWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.006,
                  ),
                  Text(
                    "If you have any question about the our team will be happy to answer them.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f13,
                        color: FontsColor.grey700),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Call",
                    style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f13,
                        fontWeight: FontsWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () async {
                      const phoneNumber = 'tel:7874118535';
                      if (await canLaunch(phoneNumber)) {
                        await launch(phoneNumber);
                      } else {
                        throw 'Could not launch $phoneNumber';
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: FontsColor.grey200,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.phoneOutline,
                              color: FontsColor.grey600,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.018,
                            ),
                            Text(
                              "123456789",
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  color: FontsColor.grey,
                                  fontSize: FontsSize.f13),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.022,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "WhatsApp",
                    style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f13,
                        fontWeight: FontsWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      launch('https://wa.me/7874118535');
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: FontsColor.grey200,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/Icons/wp.png",
                              width: MediaQuery.of(context).size.width * 0.08,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.018,
                            ),
                            Text(
                              "123456789",
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  color: FontsColor.grey,
                                  fontSize: FontsSize.f13),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.022,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Website",
                    style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f13,
                        fontWeight: FontsWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      launch('https://www.youtube.com/');
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: FontsColor.grey200,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.web,
                              color: FontsColor.grey600,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.018,
                            ),
                            Text(
                              "https://www.youtube.com/",
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  color: FontsColor.grey,
                                  fontSize: FontsSize.f13),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.022,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f13,
                        fontWeight: FontsWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () async {
                      const emailAddress = 'mailto:yashbabariya07@gmail.com';
                      if (await canLaunch(emailAddress)) {
                        await launch(emailAddress);
                      } else {
                        throw 'Could not launch $emailAddress';
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: FontsColor.grey200,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.emailOutline,
                              color: FontsColor.grey600,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.018,
                            ),
                            Text(
                              "abc@gmail.com",
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  color: FontsColor.grey,
                                  fontSize: FontsSize.f13),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
