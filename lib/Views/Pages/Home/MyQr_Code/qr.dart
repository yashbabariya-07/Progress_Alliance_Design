import 'package:flutter/material.dart';

import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({super.key});

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.purple,
        appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.width * 0.15,
            backgroundColor: BgColor.purple,
            centerTitle: true,
            title: Text(
              "My QR Code",
              style: TextStyle(
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f16,
                  color: FontsColor.white,
                  fontWeight: FontsWeight.bold),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.cancel,
                size: MediaQuery.of(context).size.width * 0.06,
                color: FontsColor.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.13,
                    backgroundColor: BgColor.white,
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.125,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                  Text(
                    "John Doe",
                    style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f18,
                        color: FontsColor.white,
                        fontWeight: FontsWeight.bold),
                  ),
                  Text(
                    "PROGRESS ALLIANCE 12 EVEREST",
                    style: TextStyle(
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f15,
                      color: FontsColor.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: FontsColor.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: QrImageView(
                    data: "123",
                    gapless: false,
                    size: MediaQuery.of(context).size.width * 0.9,
                    version: QrVersions.auto,
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.scannerRoute);
                },
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.07,
                  backgroundColor: BgColor.white,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.067,
                    backgroundColor: BgColor.purple,
                    child: Icon(
                      Icons.document_scanner,
                      size: MediaQuery.of(context).size.width * 0.065,
                      color: FontsColor.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
