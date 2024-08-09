import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/countryCode.dart';

class Connected extends StatefulWidget {
  const Connected({super.key});

  @override
  State<Connected> createState() => _ConnectedState();
}

class _ConnectedState extends State<Connected> {
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  final TextEditingController _companyname = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _join = TextEditingController();
  String _selectedGender = 'Male';

  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final ValueNotifier<String> _searchQuery = ValueNotifier<String>("");
  String _selectedCountryCode = "+91";
  String _selectedCountryFlag = "🇮🇳";
  bool isInput = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_checkInput);
  }

  void _checkInput() {
    setState(() {
      isInput = _phoneController.text.isNotEmpty;
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

    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: FontsColor.white,
        appBar: AppBar(
          backgroundColor: FontsColor.white,
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          forceMaterialTransparency: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: MediaQuery.of(context).size.width * 0.06,
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Stay Connected with US",
                      style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f16,
                        color: FontsColor.black,
                        fontWeight: FontsWeight.bold,
                      ),
                    ),
                    Text(
                      "Enhance your experience with some insights about you",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f14,
                        color: FontsColor.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "First Name",
                            style: TextStyle(
                                fontFamily: FontsFamily.inter,
                                fontSize: FontsSize.f15,
                                color: FontsColor.black,
                                fontWeight: FontsWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: FontsColor.grey, width: 0.5),
                            ),
                            child: TextFormField(
                              controller: _fname,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(10),
                                hintText: "Enter your first name",
                                hintStyle: TextStyle(
                                  fontSize: FontsSize.f13,
                                  fontFamily: FontsFamily.inter,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: FontsColor.black,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Last Name',
                            style: TextStyle(
                                fontFamily: FontsFamily.inter,
                                fontSize: FontsSize.f15,
                                color: FontsColor.black,
                                fontWeight: FontsWeight.bold),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: FontsColor.grey, width: 0.5),
                            ),
                            child: TextFormField(
                              controller: _lname,
                              decoration: InputDecoration(
                                hintText: 'Enter your last name',
                                hintStyle: TextStyle(
                                  fontSize: FontsSize.f13,
                                  fontFamily: FontsFamily.inter,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(10),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: FontsColor.black,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Text(
                  'Mobile Number',
                  style: TextStyle(
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f15,
                      color: FontsColor.black,
                      fontWeight: FontsWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Container(
                  height: mediaQuery.size.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: isInput ? FontsColor.black : FontsColor.grey,
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Text(
                  "Company Name",
                  style: TextStyle(
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f15,
                      color: FontsColor.black,
                      fontWeight: FontsWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: FontsColor.grey, width: 0.5),
                  ),
                  child: TextFormField(
                    controller: _companyname,
                    decoration: InputDecoration(
                      hintText: 'Enter your company name',
                      hintStyle: TextStyle(
                        fontSize: FontsSize.f13,
                        fontFamily: FontsFamily.inter,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: FontsColor.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Text(
                  "Gender",
                  style: TextStyle(
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f15,
                      color: FontsColor.black,
                      fontWeight: FontsWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedGender = 'Male';
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _selectedGender == 'Male'
                                ? FontsColor.black
                                : FontsColor.grey,
                            width: _selectedGender == 'Male' ? 1 : 0.5,
                          ),
                          borderRadius: BorderRadius.circular(25.sp),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/man.png",
                              width: MediaQuery.of(context).size.width * 0.075,
                              height:
                                  MediaQuery.of(context).size.height * 0.075,
                            ),
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width * 0.01,
                            // ),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontFamily: FontsFamily.inter,
                                fontSize: FontsSize.f15,
                                color: _selectedGender == 'Male'
                                    ? FontsColor.black
                                    : FontsColor.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedGender = 'Female';
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _selectedGender == 'Female'
                                ? FontsColor.black
                                : FontsColor.grey,
                            width: _selectedGender == 'Female' ? 1 : 0.5,
                          ),
                          borderRadius: BorderRadius.circular(25.sp),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/woman.png",
                              width: MediaQuery.of(context).size.width * 0.075,
                              height:
                                  MediaQuery.of(context).size.height * 0.075,
                            ),
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width * 0.015,
                            // ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontFamily: FontsFamily.inter,
                                fontSize: FontsSize.f15,
                                color: _selectedGender == 'Female'
                                    ? FontsColor.black
                                    : FontsColor.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Text(
                  'City',
                  style: TextStyle(
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f15,
                      color: FontsColor.black,
                      fontWeight: FontsWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: FontsColor.grey, width: 0.5),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: IgnorePointer(
                      child: TextFormField(
                        controller: _city,
                        decoration: InputDecoration(
                          hintText: 'Select city',
                          hintStyle: TextStyle(
                            fontSize: FontsSize.f13,
                            fontFamily: FontsFamily.inter,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(10),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: FontsColor.black,
                              width: 1,
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.arrow_drop_down,
                            size: MediaQuery.of(context).size.width * 0.06,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Text(
                  'How did you get inspired to join?',
                  style: TextStyle(
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f15,
                      color: FontsColor.black,
                      fontWeight: FontsWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: FontsColor.grey, width: 0.5),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: IgnorePointer(
                      child: TextFormField(
                        controller: _join,
                        decoration: InputDecoration(
                          hintText: 'Select from here',
                          hintStyle: TextStyle(
                            fontSize: FontsSize.f13,
                            fontFamily: FontsFamily.inter,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(10),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: FontsColor.black,
                              width: 1,
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.arrow_drop_down,
                            size: MediaQuery.of(context).size.width * 0.06,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.otpRoute);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: FontsColor.purple,
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
