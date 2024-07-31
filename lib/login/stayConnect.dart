import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_alliance/routes/route.dart';

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
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                          labelText:
                              'Search by country name, code and short...',
                          labelStyle:
                              TextStyle(fontSize: 14.sp, fontFamily: 'Inter'),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
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

    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
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
                        fontFamily: 'Inter',
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Enhance your experience with some insights about you",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        color: Colors.grey,
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
                                fontFamily: 'Inter',
                                fontSize: 15.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: TextFormField(
                              controller: _fname,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(10),
                                hintText: "Enter your first name",
                                hintStyle: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: 'Inter',
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
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
                                fontFamily: 'Inter',
                                fontSize: 15.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: TextFormField(
                              controller: _lname,
                              decoration: InputDecoration(
                                hintText: 'Enter your last name',
                                hintStyle: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: 'Inter',
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(10),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
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
                      fontFamily: 'Inter',
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Container(
                  height: mediaQuery.size.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: isInput ? Colors.black : Colors.grey, width: 1),
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Text(
                  "Company Name",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  child: TextFormField(
                    controller: _companyname,
                    decoration: InputDecoration(
                      hintText: 'Enter your company name',
                      hintStyle: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'Inter',
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Colors.black,
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
                      fontFamily: 'Inter',
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
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
                                ? Colors.black
                                : Colors.grey,
                            width: _selectedGender == 'Male' ? 1.5 : 1,
                          ),
                          borderRadius: BorderRadius.circular(25.sp),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color: _selectedGender == 'Male'
                                  ? Colors.black
                                  : Colors.black54,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.015,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 15.sp,
                                color: _selectedGender == 'Male'
                                    ? Colors.black
                                    : Colors.black54,
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
                                ? Colors.black
                                : Colors.grey,
                            width: _selectedGender == 'Female' ? 1.5 : 1,
                          ),
                          borderRadius: BorderRadius.circular(25.sp),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color: _selectedGender == 'Female'
                                  ? Colors.black
                                  : Colors.black54,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.015,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 15.sp,
                                color: _selectedGender == 'Female'
                                    ? Colors.black
                                    : Colors.black54,
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
                      fontFamily: 'Inter',
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: IgnorePointer(
                      child: TextFormField(
                        controller: _city,
                        decoration: InputDecoration(
                          hintText: 'Select city',
                          hintStyle: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: 'Inter',
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(10),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.black,
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
                      fontFamily: 'Inter',
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: IgnorePointer(
                      child: TextFormField(
                        controller: _join,
                        decoration: InputDecoration(
                          hintText: 'Select from here',
                          hintStyle: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: 'Inter',
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(10),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.black,
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
                      color: const Color.fromARGB(255, 16, 2, 90),
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
