import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/bgColor.dart';

import 'package:progress_alliance/Theme/textStyle.dart';
import 'dart:async';
import 'package:progress_alliance/Views/Pages/Login/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
          backgroundColor: BgColor.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    "assets/Logo/PA.png",
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
                            fontFamily: FontsFamily.inter,
                            fontSize: FontsSize.f15,
                            color: FontsColor.black),
                      ),
                      WidgetSpan(
                          child: Image.asset(
                        "assets/Icons/like.png",
                        width: MediaQuery.of(context).size.width * 0.06,
                      )),
                      TextSpan(
                        text: " In India",
                        style: TextStyle(
                            fontFamily: FontsFamily.inter,
                            fontSize: FontsSize.f15,
                            color: FontsColor.black),
                      ),
                    ]),
                  )),
            ],
          )),
    );
  }
}
