import 'dart:io';

import 'package:flutter/material.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/UserProfile/profileCommon.dart';

class BDetailInfo extends StatefulWidget {
  final String name;
  final String type;
  final String category;
  final String subCategory;
  final String product;
  final String gstNo;
  final String number;
  final String email;
  final String website;
  final String teamSize;
  final String formation;
  final String establish;
  final String about;
  final File? logoImage;
  final File? bannerImage;
  const BDetailInfo(
      {super.key,
      required this.name,
      required this.type,
      required this.category,
      required this.subCategory,
      required this.product,
      required this.gstNo,
      required this.number,
      required this.email,
      required this.website,
      required this.teamSize,
      required this.formation,
      required this.establish,
      required this.about,
      this.logoImage,
      this.bannerImage});

  @override
  State<BDetailInfo> createState() => _BDetailInfoState();
}

class _BDetailInfoState extends State<BDetailInfo> {
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
              title: "Business Details",
              onTap: () {
                Navigator.pushNamed(context, Routes.businessDetailRoute);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            UserDetail(
              title: "Company Name",
              detail: widget.name,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "Business Type",
              detail: widget.type,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "Business Category",
              detail: widget.category,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "Business Sub Category",
              detail: widget.subCategory,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "Products/Service",
              detail: widget.product,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "GST Number",
              detail: widget.gstNo,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "Contact Number",
              detail: widget.number,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "Email Address",
              detail: widget.email,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "Website",
              detail: widget.website,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "Team Size",
              detail: widget.teamSize,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "Business Formation",
              detail: widget.formation,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "Business established Date",
              detail: widget.establish,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            UserDetail(
              title: "About Business",
              detail: widget.about,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            if (widget.logoImage != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Logo",
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f12,
                          color: FontsColor.grey)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: FileImage(widget.logoImage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            if (widget.bannerImage != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Banner",
                    style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f11,
                        color: FontsColor.grey),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: FileImage(widget.bannerImage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
