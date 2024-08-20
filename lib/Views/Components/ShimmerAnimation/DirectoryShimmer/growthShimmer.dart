import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:shimmer/shimmer.dart';

class GrowthShimmer extends StatefulWidget {
  const GrowthShimmer({super.key});

  @override
  State<GrowthShimmer> createState() => _GrowthShimmerState();
}

class _GrowthShimmerState extends State<GrowthShimmer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Shimmer.fromColors(
        baseColor: BgColor.grey300!,
        highlightColor: BgColor.grey100!,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.055,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FontsColor.white,
                  border: Border.all(width: 0.2, color: FontsColor.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.5, horizontal: 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.087,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FontsColor.white,
                        border: Border.all(width: 0.2, color: FontsColor.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
