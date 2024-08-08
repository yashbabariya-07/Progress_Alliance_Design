import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_alliance/Views/Pages/Profile/profile.dart';

class BasicDetail extends StatefulWidget {
  const BasicDetail({super.key});

  @override
  State<BasicDetail> createState() => _BasicDetailState();
}

class _BasicDetailState extends State<BasicDetail> {
  String _prefix = 'Mr.';
  final TextEditingController _name = TextEditingController();
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _marriage = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  String _selectedGender = '';
  String _bgrp = 'A+';

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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              color: Colors.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Basic Details",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16.sp,
              color: const Color.fromARGB(255, 16, 2, 90),
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(
                      gender: _selectedGender,
                      dob: _dob.text,
                      marriage: _marriage.text,
                      mobile: _mobile.text,
                      weight: _weight.text,
                      bgroup: _bgrp,
                      spouseName: '',
                      spouseDOB: '',
                      emgName: '',
                      emgNumber: '',
                    ),
                  ),
                );
              },
              child: Text(
                "Save",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15.sp,
                  color: const Color.fromARGB(255, 16, 2, 90),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Prefix',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14.sp,
                            ),
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
                            child: DropdownButtonFormField<String>(
                              iconSize:
                                  MediaQuery.of(context).size.width * 0.06,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'Inter',
                                color: Colors.black,
                              ),
                              value: _prefix,
                              items: [
                                'Mr.',
                                'Mrs.',
                                'Miss.',
                                'Ms.',
                                'Mx.',
                                'Sir.',
                                'Clir.',
                                'Dr.'
                              ]
                                  .map((prefix) => DropdownMenuItem(
                                        value: prefix,
                                        child: Text(prefix),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _prefix = value!;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Prefix',
                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(10),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
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
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name*',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
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
                              controller: _name,
                              decoration: InputDecoration(
                                hintText: 'Enter Name',
                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Father's Name*",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
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
                                hintText: "Enter Name",
                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Surname*',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
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
                              controller: _surname,
                              decoration: InputDecoration(
                                hintText: 'Enter Surname',
                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mobile Number',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      child: TextFormField(
                        controller: _mobile,
                        decoration: InputDecoration(
                          hintText: 'Enter mobile no.',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  'Gender',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedGender = 'Male';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectedGender == 'Male'
                                  ? Colors.black
                                  : Colors.grey,
                              width: _selectedGender == 'Male' ? 1 : 0.5,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text(
                            'Male',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14.sp,
                              fontWeight: _selectedGender == 'Male'
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: _selectedGender == 'Male'
                                  ? Colors.black
                                  : Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedGender = 'Female';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectedGender == 'Female'
                                  ? Colors.black
                                  : Colors.grey,
                              width: _selectedGender == 'Female' ? 1 : 0.5,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text(
                            'Female',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14.sp,
                              fontWeight: _selectedGender == 'Female'
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: _selectedGender == 'Female'
                                  ? Colors.black
                                  : Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date of Birth',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      child: InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2010),
                            lastDate: DateTime(2050),
                          );

                          if (pickedDate != null) {
                            setState(() {
                              _dob.text =
                                  "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                            });
                          }
                        },
                        child: IgnorePointer(
                          child: TextFormField(
                            controller: _dob,
                            decoration: InputDecoration(
                              hintText: 'Select Date of Birth',
                              hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'Inter',
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 0.5,
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
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Marriage Anniversary',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      child: InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2010),
                            lastDate: DateTime(2050),
                          );

                          if (pickedDate != null) {
                            setState(() {
                              _marriage.text =
                                  "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                            });
                          }
                        },
                        child: IgnorePointer(
                          child: TextFormField(
                            controller: _marriage,
                            decoration: InputDecoration(
                              hintText: 'Select your marriage anniversary',
                              hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'Inter',
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 0.5,
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
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
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
                              controller: _weight,
                              decoration: InputDecoration(
                                hintText: 'Enter your weight',
                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
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
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Text(
                                    "KG",
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Blood Group',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
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
                            child: DropdownButtonFormField<String>(
                              iconSize:
                                  MediaQuery.of(context).size.width * 0.06,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'Inter',
                                color: Colors.black,
                              ),
                              value: _bgrp,
                              items: [
                                'A+',
                                'A-',
                                'B+',
                                'B-',
                                'AB+',
                                'AB-',
                                'O+',
                                'O-'
                              ]
                                  .map((bgrp) => DropdownMenuItem(
                                        value: bgrp,
                                        child: Text(bgrp),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _bgrp = value!;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Your blood group',
                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(10),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
