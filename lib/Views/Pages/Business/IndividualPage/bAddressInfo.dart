import 'package:flutter/material.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/UserProfile/profileCommon.dart';

class BAddressInfo extends StatefulWidget {
  final String shopNumber;
  final String streetName;
  final String area;
  final String landmark;
  final String pincode;
  final String state;
  final String city;
  const BAddressInfo(
      {super.key,
      required this.shopNumber,
      required this.streetName,
      required this.area,
      required this.landmark,
      required this.pincode,
      required this.state,
      required this.city});

  @override
  State<BAddressInfo> createState() => _BAddressInfoState();
}

class _BAddressInfoState extends State<BAddressInfo> {
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
              title: "Business Address",
              onTap: () {
                Navigator.pushNamed(context, Routes.businessAddressRoute);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            UserDetail(
              title: "Address",
              detail:
                  "${widget.shopNumber}  ${widget.streetName}   ${widget.area}  ${widget.landmark}  ${widget.city}  ${widget.state}  ${widget.pincode} ",
            ),
          ],
        ),
      ),
    );
  }
}
