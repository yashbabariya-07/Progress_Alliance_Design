import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_alliance/Routes/route.dart';

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              color: Colors.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Residential Details",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16.sp,
              color: const Color.fromARGB(255, 16, 2, 90),
              fontWeight: FontWeight.bold,
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
                  fontFamily: 'Inter',
                  fontSize: 15.sp,
                  color: const Color.fromARGB(255, 16, 2, 90),
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
                    border: Border.all(width: 0.2, color: Colors.grey),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/map.png",
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.015,
                            ),
                            Text(
                              "Pick Location",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13.sp,
                                color: const Color.fromARGB(255, 16, 2, 90),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "(Click here to pick location)",
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12.sp,
                              color: Colors.grey[700]),
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
