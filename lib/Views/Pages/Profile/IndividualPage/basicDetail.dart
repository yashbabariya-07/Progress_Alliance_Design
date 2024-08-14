import 'package:flutter/material.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/UserProfile/profileCommon.dart';

class BasicDetailInfo extends StatefulWidget {
  final String gender;
  final String dob;
  final String marriage;
  final String mobile;
  final String weight;
  final String bgroup;
  const BasicDetailInfo(
      {super.key,
      required this.gender,
      required this.dob,
      required this.marriage,
      required this.mobile,
      required this.weight,
      required this.bgroup});

  @override
  State<BasicDetailInfo> createState() => _BasicDetailInfoState();
}

class _BasicDetailInfoState extends State<BasicDetailInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.2, color: FontsColor.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DataHeading(
              title: "Basic Detail",
              onTap: () {
                Navigator.pushNamed(context, Routes.basicDetailRoute);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.018,
            ),
            UserDetail(
              title: "Gender",
              detail: widget.gender,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "Date of Birth",
              detail: widget.dob,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "Marriage Anniversary",
              detail: widget.marriage,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "Mobile Number",
              detail: widget.mobile,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "Weight",
              detail: widget.weight,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "Blood Group",
              detail: widget.bgroup,
            ),
          ],
        ),
      ),
    );
  }
}
