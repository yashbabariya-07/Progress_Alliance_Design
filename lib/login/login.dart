import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_alliance/routes/route.dart';

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

  void _showCountryCode(BuildContext context) {
    final List<Map<String, String>> countries = [
      {'name': 'Canada', 'code': '+1', 'flag': '🇨🇦'},
      {'name': 'United States', 'code': '+1', 'flag': '🇺🇸'},
      {'name': 'India', 'code': '+91', 'flag': '🇮🇳'},
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: MediaQuery.of(context).size.width * 0.06,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.22,
                      ),
                      Text(
                        'Select a Country',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Divider(
                    thickness: 0.2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey, width: 0.2),
                    ),
                    child: TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                          hintText: 'Search by country name, code and short...',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Inter',
                            color: Colors.grey[700],
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(10),
                          prefixIcon: Icon(
                            Icons.search,
                            size: MediaQuery.of(context).size.width * 0.06,
                            color: Colors.orange,
                          )),
                      onChanged: (value) {
                        _searchQuery.value = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Expanded(
                    child: ValueListenableBuilder<String>(
                      valueListenable: _searchQuery,
                      builder: (context, value, child) {
                        final filteredCountries = countries.where((country) {
                          final countryName = country['name']!.toLowerCase();
                          final countryCode = country['code']!.toLowerCase();
                          final searchValue = value.toLowerCase();
                          return countryName.contains(searchValue) ||
                              countryCode.contains(searchValue);
                        }).toList();
                        return ListView.builder(
                          itemCount: filteredCountries.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text(
                                filteredCountries[index]['flag']!,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              title: Text(
                                filteredCountries[index]['name']!,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                filteredCountries[index]['code']!,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedCountryCode =
                                      filteredCountries[index]['code']!;
                                  _selectedCountryFlag =
                                      filteredCountries[index]['flag']!;
                                });
                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    bool isKeyboardOpen = mediaQuery.viewInsets.bottom > 0;
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
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
                          fontFamily: 'Inter',
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Use mobile number to get continue",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12.sp,
                          color: Colors.grey[700],
                        ),
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
                        color:
                            isKeyboardOpen == true ? Colors.black : Colors.grey,
                        width: 0.5),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => _showCountryCode(context),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                _selectedCountryFlag,
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                _selectedCountryCode,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',
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
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: BorderSide.strokeAlignCenter),
                        child: VerticalDivider(
                          width: 0.2,
                          color: Colors.grey,
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
                              fontSize: 14.sp,
                              fontFamily: 'Inter',
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
                          color: const Color.fromARGB(255, 16, 2, 90),
                        ),
                        child: Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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
                              fontFamily: 'Inter',
                              fontSize: 13.sp,
                              color: Colors.grey[700],
                            ),
                          ),
                          TextSpan(
                            text: "Terms of service",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13.sp,
                              color: const Color.fromARGB(255, 16, 2, 90),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: " and ",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13.sp,
                              color: Colors.grey[700],
                            ),
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13.sp,
                              color: const Color.fromARGB(255, 16, 2, 90),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: " in use of the Our app.",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13.sp,
                              color: Colors.grey[700],
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
