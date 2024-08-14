import 'package:flutter/material.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/UserProfile/profileCommon.dart';

class BSocialInfo extends StatefulWidget {
  const BSocialInfo({super.key});

  @override
  State<BSocialInfo> createState() => _BSocialInfoState();
}

class _BSocialInfoState extends State<BSocialInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.2, color: FontsColor.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DataHeading(
              title: "Social Account",
              onTap: () {
                Navigator.pushNamed(context, Routes.socialAccountRoute);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
