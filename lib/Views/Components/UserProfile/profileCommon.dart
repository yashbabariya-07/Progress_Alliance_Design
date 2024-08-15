import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class DataHeading extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const DataHeading({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f15,
              color: FontsColor.purple,
              fontWeight: FontsWeight.bold),
        ),
        GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.035,
              backgroundColor: BgColor.grey300,
              child: Center(
                child: Icon(
                  MdiIcons.pencilOutline,
                  size: MediaQuery.of(context).size.width * 0.045,
                ),
              ),
            ))
      ],
    );
  }
}

class UserDetail extends StatelessWidget {
  final String title;
  final String detail;
  const UserDetail({super.key, required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontFamily: FontsFamily.inter,
                fontSize: FontsSize.f12,
                color: FontsColor.grey)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.006,
        ),
        Text(
          detail,
          style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f14,
              fontWeight: FontsWeight.bold),
        ),
      ],
    );
  }
}
