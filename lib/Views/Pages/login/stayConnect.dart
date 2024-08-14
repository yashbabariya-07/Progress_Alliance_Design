import 'package:flutter/material.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/Button/CommonButton.dart';
import 'package:progress_alliance/Views/Components/LoginTextFormField/loginCustom.dart';

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
  String _selectedGender = '';

  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final ValueNotifier<String> _searchQuery = ValueNotifier<String>("");
  bool isInput = false;
  bool _isAnyFieldFocused = false;

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
        backgroundColor: BgColor.white,
        appBar: AppBar(
          backgroundColor: BgColor.white,
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
                        fontWeight: FontWeight.bold,
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
                        onFocusChange: (hasFocus) {
                          setState(() {
                            _isAnyFieldFocused = hasFocus;
                          });
                        },
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
                        onFocusChange: (hasFocus) {
                          setState(() {
                            _isAnyFieldFocused = hasFocus;
                          });
                        },
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
                MobileNumberInput(
                  phoneController: _phoneController,
                  searchController: _searchController,
                  searchQuery: _searchQuery,
                  isHighlighted: _isAnyFieldFocused || isInput,
                  onCountrySelected: (code, flag) {
                    setState(() {});
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                ConnectCustomTextField(
                  label: 'Company Name',
                  hintText: 'Enter your company name',
                  controller: _companyname,
                  onFocusChange: (hasFocus) {
                    setState(() {
                      _isAnyFieldFocused = hasFocus;
                    });
                  },
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
                  onFocusChange: (hasFocus) {
                    setState(() {
                      _isAnyFieldFocused = hasFocus;
                    });
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                ConnectPageSelectionField(
                  label: 'How did you get inspired to join?',
                  hintText: 'Select from here',
                  controller: _join,
                  onTap: () {},
                  onFocusChange: (hasFocus) {
                    setState(() {
                      _isAnyFieldFocused = hasFocus;
                    });
                  },
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
