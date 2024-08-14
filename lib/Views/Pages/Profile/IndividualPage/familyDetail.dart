import 'package:flutter/material.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/UserProfile/profileCommon.dart';
import 'package:progress_alliance/Views/Pages/Profile/IndividualPage/childrenTable.dart';

class FDetailInfo extends StatefulWidget {
  final String spouseName;
  final String spouseDOB;
  final String emgName;
  final String emgNumber;
  const FDetailInfo(
      {super.key,
      required this.spouseName,
      required this.spouseDOB,
      required this.emgName,
      required this.emgNumber});

  @override
  State<FDetailInfo> createState() => _FDetailInfoState();
}

class _FDetailInfoState extends State<FDetailInfo> {
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
              title: "Family Details",
              onTap: () {
                Navigator.pushNamed(context, Routes.familyDetailRoute);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.018,
            ),
            UserDetail(
              title: "Spouse Name",
              detail: widget.spouseName,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "Spouse Date of Birth",
              detail: widget.spouseDOB,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.006,
            ),
            Text('Children',
                style: TextStyle(
                    fontFamily: FontsFamily.inter,
                    fontSize: FontsSize.f12,
                    color: FontsColor.grey)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.006,
            ),
            const ChildTable(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.006,
            ),
            UserDetail(
              title: "Emergency Person's Name",
              detail: widget.emgName,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "Emergency Person's Number",
              detail: widget.emgNumber,
            ),
          ],
        ),
      ),
    );
  }
}
