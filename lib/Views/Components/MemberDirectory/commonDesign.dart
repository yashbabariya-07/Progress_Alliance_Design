import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class TeamTitleCard extends StatelessWidget {
  final String title;
  const TeamTitleCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: double.infinity,
      color: FontsColor.grey200,
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
}

class PersonCard extends StatelessWidget {
  final String title;
  final String cname;
  const PersonCard({super.key, required this.title, required this.cname});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.2,
            color: FontsColor.grey,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.06,
                backgroundColor: BgColor.green,
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
                      title,
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f14,
                          fontWeight: FontsWeight.bold),
                    ),
                    Flexible(
                      child: Text(cname,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f12,
                              color: FontsColor.grey)),
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
      ),
    );
  }
}

class TeamHeadCard extends StatelessWidget {
  final String title;
  final String personName;
  final String company;
  const TeamHeadCard(
      {super.key,
      required this.title,
      required this.personName,
      required this.company});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
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
                    backgroundColor: BgColor.blue,
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
