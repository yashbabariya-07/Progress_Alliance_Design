import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/routes/route.dart';
import 'package:shimmer/shimmer.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String selectedOption = 'General';

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMM yyyy, hh:mm a').format(now);
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              color: Colors.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Notification",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16.sp,
              color: Color.fromARGB(255, 16, 2, 90),
              fontWeight: FontWeight.bold,
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
                            ? Colors.white
                            : Colors.grey[200],
                        border: Border.all(
                          color: selectedOption == 'General'
                              ? Color.fromARGB(255, 16, 2, 90)
                              : Colors.transparent,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'General',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              color: selectedOption == 'General'
                                  ? Color.fromARGB(255, 16, 2, 90)
                                  : Colors.black,
                              fontSize: 15.sp),
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
                            ? Colors.white
                            : Colors.grey[200],
                        border: Border.all(
                          color: selectedOption == 'Business'
                              ? Color.fromARGB(255, 16, 2, 90)
                              : Colors.transparent,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Business',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              color: selectedOption == 'Business'
                                  ? Color.fromARGB(255, 16, 2, 90)
                                  : Colors.black,
                              fontSize: 15.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.012,
              ),
              _isLoading
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.only(bottom: 5),
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                            backgroundColor: Colors.blue[100],
                            child: Icon(
                              MdiIcons.bellOutline,
                              color: Colors.blue,
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
                                      fontFamily: 'Inter',
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                RichText(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text:
                                          "Congratulations, You have got new lead from Axar Patel...",
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 13.sp,
                                          color: Colors.grey[900]),
                                    ),
                                    TextSpan(
                                      text: "View More",
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 13.sp,
                                          color: Color.fromARGB(255, 16, 2, 90),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                ),
                                Text(
                                  formattedDate,
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.grey,
                                      fontSize: 13.sp),
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
