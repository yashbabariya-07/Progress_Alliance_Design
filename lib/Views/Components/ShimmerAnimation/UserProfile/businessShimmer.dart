import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:shimmer/shimmer.dart';

class Businessshimmer extends StatelessWidget {
  const Businessshimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: BgColor.grey300!,
        highlightColor: BgColor.grey100!,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.32,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: FontsColor.grey200),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: FontsColor.grey200),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.012,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.11,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: FontsColor.grey200),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.012,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.09,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: FontsColor.grey200),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.centerRight,
              height: MediaQuery.of(context).size.width * 0.1,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: FontsColor.grey200),
            ),
          ),
        ]));
  }
}
