import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:shimmer/shimmer.dart';

class PAChapterShimmer extends StatefulWidget {
  const PAChapterShimmer({super.key});

  @override
  State<PAChapterShimmer> createState() => _PAChapterShimmerState();
}

class _PAChapterShimmerState extends State<PAChapterShimmer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Shimmer.fromColors(
        baseColor: FontsColor.grey300!,
        highlightColor: FontsColor.grey100!,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
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