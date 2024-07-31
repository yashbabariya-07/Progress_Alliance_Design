import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_alliance/routes/route.dart';
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
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: const Color(0xFF00008B),
        appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.width * 0.15,
            backgroundColor: const Color(0xFF00008B),
            centerTitle: true,
            title: Text(
              "My QR Code",
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.cancel,
                size: MediaQuery.of(context).size.width * 0.06,
                color: Colors.white,
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
                    backgroundColor: Colors.white,
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
                        fontFamily: 'Inter',
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "PROGRESS ALLIANCE 12 EVEREST",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
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
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.067,
                    backgroundColor: Color(0xFF00008B),
                    child: Icon(
                      Icons.document_scanner,
                      size: MediaQuery.of(context).size.width * 0.065,
                      color: Colors.white,
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
