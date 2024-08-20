import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:progress_alliance/Views/Components/AppBar/fullAppbar.dart';
import 'package:shimmer/shimmer.dart';

class AdService extends StatefulWidget {
  const AdService({super.key});

  @override
  State<AdService> createState() => _AdServiceState();
}

class _AdServiceState extends State<AdService> with LoadingStateMixin {
  final List<Map<String, String>> services = [
    {"name": "Service 1", "image": "assets/Images/s1.jpg"},
    {"name": "Service 2", "image": "assets/Images/s1.jpg"},
    {"name": "Service 3", "image": "assets/Images/surat.jpg"},
    {"name": "Service 4", "image": "assets/Images/s1.jpg"},
    {"name": "Service 5", "image": "assets/Images/surat.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        appBar: CustomeAppBar(
          title: "Advertising Services",
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: MediaQuery.of(context).size.width * 0.06,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    final service = services[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.companyDetailRoute);
                      },
                      child: isLoading
                          ? Shimmer.fromColors(
                              baseColor: BgColor.grey300!,
                              highlightColor: BgColor.grey100!,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: FontsColor.grey200),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                    service["image"]!,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 1, sigmaY: 1),
                                        child: Container(
                                            color: FontsColor.transparent),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        service["name"]!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f16,
                                          fontWeight: FontsWeight.bold,
                                          color: FontsColor.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
