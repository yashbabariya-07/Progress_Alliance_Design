import 'package:flutter/material.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/CommonButton.dart';
import 'package:progress_alliance/Views/Components/LoginTextFormField/loginCustom.dart';
import 'package:progress_alliance/Views/Components/LoginTextFormField/countryCode.dart';

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
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
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
                      child: ConnectCustomTextField(
                        label: 'First Name',
                        hintText: 'Enter your first name',
                        controller: _fname,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Flexible(
                      child: ConnectCustomTextField(
                        label: 'Last Name',
                        hintText: 'Enter your last name',
                        controller: _lname,
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
                ConnectCustomTextField(
                  label: 'Company Name',
                  hintText: 'Enter your company name',
                  controller: _companyname,
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
                    GenderButton(
                      gender: 'Male',
                      selectedGender: _selectedGender,
                      onTap: () {
                        setState(() {
                          _selectedGender = 'Male';
                        });
                      },
                      iconPath: "assets/Icons/man.png",
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    GenderButton(
                      gender: 'Female',
                      selectedGender: _selectedGender,
                      onTap: () {
                        setState(() {
                          _selectedGender = 'Female';
                        });
                      },
                      iconPath: "assets/Icons/woman.png",
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                ConnectPageSelectionField(
                  label: 'City',
                  hintText: 'Select city',
                  controller: _city,
                  onTap: () {},
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                ConnectPageSelectionField(
                  label: 'How did you get inspired to join?',
                  hintText: 'Select from here',
                  controller: _join,
                  onTap: () {},
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                CommonButton(
                    text: "Submit",
                    onTap: () {
                      Navigator.pushNamed(context, Routes.otpRoute);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
