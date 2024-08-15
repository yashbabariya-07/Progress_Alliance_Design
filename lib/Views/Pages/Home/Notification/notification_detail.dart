import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/Button/CommonButton.dart';
import 'package:progress_alliance/Views/Components/AppBar/leadingTitleAppBar.dart';

class NotificationDetail extends StatefulWidget {
  const NotificationDetail({super.key});

  @override
  State<NotificationDetail> createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMM yyyy, hh:mm a').format(now);
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        appBar: const LeadTitleAppBar(
          title: "Notification Details",
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.22,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: FontsColor.grey200),
                    child: Icon(
                      Icons.photo,
                      size: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ),
                  Positioned(
                      right: MediaQuery.of(context).size.width * 0.02,
                      bottom: MediaQuery.of(context).size.width * 0.02,
                      child: Icon(
                        Icons.camera,
                        size: MediaQuery.of(context).size.width * 0.06,
                      )),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                formattedDate,
                style: TextStyle(
                    fontFamily: FontsFamily.inter,
                    color: FontsColor.grey,
                    fontSize: FontsSize.f13),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.012,
              ),
              Text(
                'You Have New Lead',
                style: TextStyle(
                    fontFamily: FontsFamily.inter,
                    fontSize: FontsSize.f15,
                    fontWeight: FontsWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.006,
              ),
              Text(
                'Congratulations, You have got new lead from Axar Patel',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: FontsFamily.inter,
                    fontSize: FontsSize.f14,
                    color: FontsColor.grey900),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              CommonButton(
                  text: "Go To Page",
                  onTap: () {
                    Navigator.pushNamed(context, Routes.detailPersonRoute);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
