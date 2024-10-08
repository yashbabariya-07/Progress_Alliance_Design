import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/AppBar/leadingTitleAppBar.dart';
import 'package:progress_alliance/Views/Components/DrawerField/contactUsComman.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  void initState() {
    super.initState();
    // Apply FLAG_SECURE when entering this page
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void dispose() {
    // Remove FLAG_SECURE when leaving this page
    FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        appBar: const LeadTitleAppBar(
          title: "Contact Us",
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
              CustomeField(
                label: "Call",
                hintText: "123456789",
                icons: MdiIcons.phoneOutline,
                onTap: () async {
                  const phoneNumber = 'tel:7874118535';
                  if (await canLaunch(phoneNumber)) {
                    await launch(phoneNumber);
                  } else {
                    throw 'Could not launch $phoneNumber';
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.022,
              ),
              CustomeField(
                label: "WhatsApp",
                hintText: "123456789",
                image: Image.asset(
                  "assets/Icons/wp.png",
                  width: MediaQuery.of(context).size.width * 0.08,
                ),
                onTap: () {
                  launch('https://wa.me/7874118535');
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.022,
              ),
              CustomeField(
                label: "Website",
                hintText: "https://www.youtube.com/",
                icons: MdiIcons.web,
                onTap: () {
                  launch('https://www.youtube.com/');
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.022,
              ),
              CustomeField(
                label: "Email",
                hintText: "abc@gmail.com",
                icons: MdiIcons.emailOutline,
                onTap: () async {
                  const emailAddress = 'mailto:yashbabariya07@gmail.com';
                  if (await canLaunch(emailAddress)) {
                    await launch(emailAddress);
                  } else {
                    throw 'Could not launch $emailAddress';
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
