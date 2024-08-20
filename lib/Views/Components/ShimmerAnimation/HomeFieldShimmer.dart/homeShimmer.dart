import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatefulWidget {
  const HomeShimmer({super.key});

  @override
  State<HomeShimmer> createState() => _HomeShimmerState();
}

class _HomeShimmerState extends State<HomeShimmer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Shimmer.fromColors(
          baseColor: BgColor.grey300!,
          highlightColor: BgColor.grey100!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: FontsColor.grey200),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.008,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.025,
                  height: MediaQuery.of(context).size.width * 0.025,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: FontsColor.grey200),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.025,
                  height: MediaQuery.of(context).size.width * 0.025,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: FontsColor.grey200),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.025,
                  height: MediaQuery.of(context).size.width * 0.025,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: FontsColor.grey200),
                ),
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: MediaQuery.of(context).size.width * 0.24,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: FontsColor.grey200),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: MediaQuery.of(context).size.width * 0.24,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: FontsColor.grey200),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: FontsColor.grey200),
              ),
            ],
          )),
    );
  }
}
