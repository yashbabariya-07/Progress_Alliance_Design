import 'package:flutter/material.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/Button/CommonButton.dart';
import 'package:progress_alliance/Views/Components/LoginTextFormField/loginCustom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final ValueNotifier<String> _searchQuery = ValueNotifier<String>("");
  bool _isHighlighted = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_checkInput);
  }

  void _checkInput() {
    setState(() {
      _isHighlighted = _phoneController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _phoneController.removeListener(_checkInput);
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    bool isKeyboardOpen = mediaQuery.viewInsets.bottom > 0;
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Enter mobile number",
                        style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f18,
                          color: FontsColor.black,
                          fontWeight: FontsWeight.bold,
                        ),
                      ),
                      Text(
                        "Use mobile number to get continue",
                        style: TextStyle(
                            fontFamily: FontsFamily.inter,
                            fontSize: FontsSize.f12,
                            color: FontsColor.grey700),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: mediaQuery.size.height * 0.045),
                MobileNumberInput(
                  phoneController: _phoneController,
                  searchController: _searchController,
                  searchQuery: _searchQuery,
                  isHighlighted: isKeyboardOpen || _isHighlighted,
                  onCountrySelected: (code, flag) {
                    setState(() {});
                  },
                ),
                const Spacer(),
                Column(
                  children: [
                    CommonButton(
                        text: "Next",
                        onTap: () {
                          // await FirebaseAuth.instance.verifyPhoneNumber(
                          //     verificationCompleted:
                          //         (PhoneAuthCredential credential) {},
                          //     verificationFailed: (FirebaseAuthException ex) {},
                          //     codeSent:
                          //         (String verificationid, int? resendtoken) {

                          //     },
                          //     codeAutoRetrievalTimeout:
                          //         (String verificationId) {},
                          //     phoneNumber: _phoneController.text.toString());
                          Navigator.pushNamed(context, Routes.connectRoute);
                        }),
                    SizedBox(height: mediaQuery.size.height * 0.02),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "By providing my phone number, I hereby agree and accept the ",
                            style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f13,
                              color: FontsColor.grey700,
                            ),
                          ),
                          TextSpan(
                            text: "Terms of service",
                            style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f13,
                              color: FontsColor.purple,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: " and ",
                            style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f13,
                              color: FontsColor.grey700,
                            ),
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f13,
                              color: FontsColor.purple,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: " in use of the Our app.",
                            style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f13,
                              color: FontsColor.grey700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
