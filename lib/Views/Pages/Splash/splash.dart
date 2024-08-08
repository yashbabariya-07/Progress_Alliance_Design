import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:progress_alliance/Views/Pages/login/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    "assets/PA.png",
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Made With",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15.sp,
                            color: Colors.black),
                      ),
                      WidgetSpan(
                          child: Image.asset(
                        "assets/like.png",
                        width: MediaQuery.of(context).size.width * 0.06,
                      )),
                      TextSpan(
                        text: " In India",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15.sp,
                            color: Colors.black),
                      ),
                    ]),
                  )),
            ],
          )),
    );
  }
}
