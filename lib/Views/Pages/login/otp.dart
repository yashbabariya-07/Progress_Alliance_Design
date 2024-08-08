import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:progress_alliance/Routes/route.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Verify your\nphone number",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "A verification code has been sent to",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13.sp,
                      color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "+918766098574",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: _otpController,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: MediaQuery.of(context).size.width * 0.12,
                    fieldWidth: MediaQuery.of(context).size.width * 0.12,
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey,
                    selectedColor: Colors.black,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  "Didn't you receive any code?",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12.sp,
                      color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Text(
                  "RESEND CODE (07)",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12.sp,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.homeRoute);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(255, 16, 2, 90),
                    ),
                    child: Center(
                      child: Text(
                        "Verify",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
