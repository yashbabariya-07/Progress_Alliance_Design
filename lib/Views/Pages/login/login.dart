import 'package:flutter/material.dart';

import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/countryCode.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final ValueNotifier<String> _searchQuery = ValueNotifier<String>("");
  String _selectedCountryCode = "+91";
  String _selectedCountryFlag = "🇮🇳";

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    bool isKeyboardOpen = mediaQuery.viewInsets.bottom > 0;
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: FontsColor.white,
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
                Container(
                  height: mediaQuery.size.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: isKeyboardOpen == true
                            ? FontsColor.black
                            : FontsColor.grey,
                        width: 0.5),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          CountryCode.showCountryCode(
                            context: context,
                            searchController: _searchController,
                            searchQuery: _searchQuery,
                            onCountrySelected: (code, flag) {
                              setState(() {
                                _selectedCountryCode = code;
                                _selectedCountryFlag = flag;
                              });
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                _selectedCountryFlag,
                                style: TextStyle(fontSize: FontsSize.f18),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                _selectedCountryCode,
                                style: TextStyle(
                                  fontSize: FontsSize.f14,
                                  fontFamily: FontsFamily.inter,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Icon(
                                Icons.arrow_drop_down,
                                size: MediaQuery.of(context).size.width * 0.06,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: BorderSide.strokeAlignCenter),
                        child: VerticalDivider(
                          width: 0.2,
                          color: FontsColor.grey,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 14),
                            hintText: "Enter your mobile number",
                            hintStyle: TextStyle(
                              fontSize: FontsSize.f14,
                              fontFamily: FontsFamily.inter,
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.connectRoute);
                      },
                      child: Container(
                        height: mediaQuery.size.height * 0.06,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: FontsColor.purple,
                        ),
                        child: Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f15,
                              color: FontsColor.white,
                              fontWeight: FontsWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
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
