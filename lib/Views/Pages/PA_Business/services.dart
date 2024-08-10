import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:shimmer/shimmer.dart';

class AdService extends StatefulWidget {
  const AdService({super.key});

  @override
  State<AdService> createState() => _AdServiceState();
}

class _AdServiceState extends State<AdService> {
  final List<Map<String, String>> services = [
    {"name": "Service 1", "image": "assets/Images/s1.jpg"},
    {"name": "Service 2", "image": "assets/Images/s1.jpg"},
    {"name": "Service 3", "image": "assets/Images/surat.jpg"},
    {"name": "Service 4", "image": "assets/Images/s1.jpg"},
    {"name": "Service 5", "image": "assets/Images/surat.jpg"},
  ];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: FontsColor.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          backgroundColor: FontsColor.white,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
          title: Text(
            "Advertising Services",
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f16,
              color: FontsColor.purple,
              fontWeight: FontsWeight.bold,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: FontsColor.grey,
              height: 0.2,
            ),
          ),
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
                      child: _isLoading
                          ? Shimmer.fromColors(
                              baseColor: FontsColor.grey300!,
                              highlightColor: FontsColor.grey100!,
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
