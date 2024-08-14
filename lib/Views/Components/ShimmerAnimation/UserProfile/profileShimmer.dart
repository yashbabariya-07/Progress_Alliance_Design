import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: FontsColor.grey300!,
      highlightColor: FontsColor.grey100!,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: FontsColor.grey200),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.02,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: FontsColor.grey200),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.002,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.02,
                width: MediaQuery.of(context).size.width * 0.35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: FontsColor.grey200),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.002,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.02,
                width: MediaQuery.of(context).size.width * 0.55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: FontsColor.grey200),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.002,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.02,
                width: MediaQuery.of(context).size.width * 0.35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: FontsColor.grey200),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
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
              height: MediaQuery.of(context).size.height * 0.2,
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
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: FontsColor.grey200),
            ),
          ),
        ],
      ),
    );
  }
}
