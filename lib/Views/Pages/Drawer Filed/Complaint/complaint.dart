import 'package:flutter/material.dart';

import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/AppBar/leadingTitleAppBar.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        appBar: const LeadTitleAppBar(
          title: 'My Complaints',
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.width * 0.03,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.addComplaintRoute);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    color: FontsColor.purple,
                    border: Border.all(width: 1, color: FontsColor.transparent),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      "+ Complaint",
                      style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f14,
                        color: FontsColor.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
