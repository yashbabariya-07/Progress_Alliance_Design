import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class PADrawer extends StatelessWidget {
  const PADrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.64,
      child: Drawer(
        backgroundColor: FontsColor.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Image.asset(
                "assets/Logo/PA.png",
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              const Divider(thickness: 0.5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.note_add_outlined,
                          color: FontsColor.black,
                          size: MediaQuery.of(context).size.width * 0.06,
                        ),
                        title: Text(
                          "Complaint",
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f14,
                              fontWeight: FontsWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.ComplaintRoute);
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          MdiIcons.downloadCircleOutline,
                          color: FontsColor.black,
                          size: MediaQuery.of(context).size.width * 0.06,
                        ),
                        title: Text(
                          "Downloads",
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f14,
                              fontWeight: FontsWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.downloadRoute);
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.feedback_outlined,
                          color: FontsColor.black,
                          size: MediaQuery.of(context).size.width * 0.06,
                        ),
                        title: Text(
                          "Feedback & Review",
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f14,
                              fontWeight: FontsWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.feedbackRoute);
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.contact_mail,
                          color: FontsColor.black,
                          size: MediaQuery.of(context).size.width * 0.06,
                        ),
                        title: Text(
                          "Contact Us",
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f14,
                              fontWeight: FontsWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.contactRoute);
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          MdiIcons.informationOutline,
                          color: FontsColor.black,
                          size: MediaQuery.of(context).size.width * 0.06,
                        ),
                        title: Text(
                          "About Us",
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f14,
                              fontWeight: FontsWeight.bold),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(
                          MdiIcons.helpCircleOutline,
                          color: FontsColor.black,
                          size: MediaQuery.of(context).size.width * 0.06,
                        ),
                        title: Text(
                          "Help?",
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f14,
                              fontWeight: FontsWeight.bold),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red[50],
                  ),
                  height: MediaQuery.of(context).size.width * 0.1,
                  width: MediaQuery.of(context).size.width * 0.32,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        MdiIcons.power,
                        color: Colors.red,
                        size: MediaQuery.of(context).size.width * 0.06,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.009),
                      Text(
                        "LOG OUT",
                        style: TextStyle(
                            fontFamily: FontsFamily.inter,
                            fontSize: FontsSize.f13,
                            fontWeight: FontsWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
