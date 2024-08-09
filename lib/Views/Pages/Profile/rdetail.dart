import 'package:flutter/material.dart';

import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class ResidentialDetail extends StatefulWidget {
  const ResidentialDetail({super.key});

  @override
  State<ResidentialDetail> createState() => _ResidentialDetailState();
}

class _ResidentialDetailState extends State<ResidentialDetail> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: FontsColor.white,
        appBar: AppBar(
          backgroundColor: FontsColor.white,
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              color: FontsColor.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Residential Details",
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f16,
              color: FontsColor.purple,
              fontWeight: FontsWeight.bold,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Save",
                style: TextStyle(
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f15,
                  color: FontsColor.purple,
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.mapRoute);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.085,
                  width: MediaQuery.of(context).size.width * 0.55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.2, color: FontsColor.grey),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/Images/map.png",
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.015,
                            ),
                            Text(
                              "Pick Location",
                              style: TextStyle(
                                fontFamily: FontsFamily.inter,
                                fontSize: FontsSize.f13,
                                color: FontsColor.purple,
                                fontWeight: FontsWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "(Click here to pick location)",
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f12,
                              color: FontsColor.grey700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
