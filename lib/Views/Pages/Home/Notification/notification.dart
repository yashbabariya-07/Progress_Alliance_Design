import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:progress_alliance/Views/Components/AppBar/leadingTitleAppBar.dart';
import 'package:shimmer/shimmer.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with LoadingStateMixin {
  String selectedOption = 'General';

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
          title: "Notification",
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = 'General';
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selectedOption == 'General'
                            ? FontsColor.white
                            : FontsColor.grey200,
                        border: Border.all(
                          color: selectedOption == 'General'
                              ? FontsColor.purple
                              : FontsColor.transparent,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'General',
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              color: selectedOption == 'General'
                                  ? FontsColor.purple
                                  : FontsColor.black,
                              fontSize: FontsSize.f15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.015,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = 'Business';
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selectedOption == 'Business'
                            ? FontsColor.white
                            : FontsColor.grey200,
                        border: Border.all(
                          color: selectedOption == 'Business'
                              ? FontsColor.purple
                              : FontsColor.transparent,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Business',
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              color: selectedOption == 'Business'
                                  ? FontsColor.purple
                                  : FontsColor.black,
                              fontSize: FontsSize.f15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.012,
              ),
              isLoading
                  ? Shimmer.fromColors(
                      baseColor: BgColor.grey300!,
                      highlightColor: BgColor.grey100!,
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.only(bottom: 5),
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FontsColor.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ))
                  : GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.notificationDetailRoute);
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.05,
                            backgroundColor: BgColor.blue100,
                            child: Icon(
                              MdiIcons.bellOutline,
                              color: FontsColor.blue,
                              size: MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'You Have New Lead',
                                  style: TextStyle(
                                      fontFamily: FontsFamily.inter,
                                      fontSize: FontsSize.f15,
                                      fontWeight: FontsWeight.bold),
                                ),
                                RichText(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text:
                                          "Congratulations, You have got new lead from Axar Patel...",
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f13,
                                          color: FontsColor.grey900),
                                    ),
                                    TextSpan(
                                      text: "View More",
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f13,
                                          color: FontsColor.purple,
                                          fontWeight: FontsWeight.bold),
                                    ),
                                  ]),
                                ),
                                Text(
                                  formattedDate,
                                  style: TextStyle(
                                      fontFamily: FontsFamily.inter,
                                      color: FontsColor.grey,
                                      fontSize: FontsSize.f13),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
