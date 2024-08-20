import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:shimmer/shimmer.dart';

class DirectoryShimmer extends StatefulWidget {
  const DirectoryShimmer({super.key});

  @override
  State<DirectoryShimmer> createState() => _DirectoryShimmerState();
}

class _DirectoryShimmerState extends State<DirectoryShimmer> {
  List<Map<String, String>> cities = [
    {"image": "assets/Images/surat.jpg", "label": "Ahemdabad"},
    {"image": "assets/Images/surat.jpg", "label": "Ankleshwar"},
    {"image": "assets/Images/surat.jpg", "label": "Bhavnagar"},
    {"image": "assets/Images/surat.jpg", "label": "Jetpur"},
    {"image": "assets/Images/surat.jpg", "label": "Nashik"},
    {"image": "assets/Images/surat.jpg", "label": "Navsari"},
    {"image": "assets/Images/surat.jpg", "label": "Rajkot"},
    {"image": "assets/Images/surat.jpg", "label": "Surat"},
    {"image": "assets/Images/surat.jpg", "label": "Universal"},
    {"image": "assets/Images/surat.jpg", "label": "Vadodara"},
    {"image": "assets/Images/surat.jpg", "label": "Vapi"},
  ];
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: BgColor.grey300!,
      highlightColor: BgColor.grey100!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: double.infinity,
            decoration: BoxDecoration(
              color: FontsColor.white,
              border: Border.all(width: 0.2, color: FontsColor.grey),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.004,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: FontsColor.grey200),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.022,
                width: MediaQuery.of(context).size.width * 0.24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: FontsColor.grey200),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.022,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: FontsColor.grey200),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 8, childAspectRatio: 1),
              itemCount: cities.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: FontsColor.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.099,
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.097,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
