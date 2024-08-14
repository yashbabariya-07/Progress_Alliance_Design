import 'package:flutter/material.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/UserProfile/profileCommon.dart';

class RDetailInfo extends StatefulWidget {
  const RDetailInfo({super.key});

  @override
  State<RDetailInfo> createState() => _RDetailInfoState();
}

class _RDetailInfoState extends State<RDetailInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.2, color: FontsColor.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DataHeading(
              title: "Residential Details",
              onTap: () {
                Navigator.pushNamed(context, Routes.locationRoute);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.018,
            ),
            Text("Address",
                style: TextStyle(
                    fontFamily: FontsFamily.inter,
                    fontSize: FontsSize.f12,
                    color: FontsColor.grey)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.006,
            ),
            Text(
              "your address",
              style: TextStyle(
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f14,
                  fontWeight: FontsWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
