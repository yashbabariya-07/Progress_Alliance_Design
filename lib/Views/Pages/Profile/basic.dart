import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/AppBar/fullAppbar.dart';
import 'package:progress_alliance/Views/Components/userTextField.dart/customeTextFormField.dart';
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
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        appBar: CustomeAppBar(
          title: "Basic Details",
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profile(),
                  ),
                );
              },
              child: Text(
                "Save",
                style: TextStyle(
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f15,
                  color: FontsColor.purple,
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
                        child: UserDropdownField(
                          label: 'Prefix',
                          hint: 'Prefix',
                          value: _prefix,
                          items: const [
                            'Mr.',
                            'Mrs.',
                            'Miss.',
                            'Ms.',
                            'Mx.',
                            'Sir.',
                            'Clir.',
                            'Dr.',
                          ],
                          onChanged: (value) {
                            setState(() {
                              _prefix = value!;
                            });
                          },
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Flexible(
                      flex: 5,
                      child: UserCustomTextField(
                          label: 'Name*',
                          hintText: 'Enter Name',
                          controller: _name),
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
                      child: UserCustomTextField(
                          label: "Father's Name*",
                          hintText: 'Enter Name',
                          controller: _fname),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Flexible(
                      flex: 5,
                      child: UserCustomTextField(
                          label: "Surname*",
                          hintText: 'Enter Surname',
                          controller: _surname),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                UserCustomTextField(
                    label: "Mobile Number",
                    hintText: 'Enter mobile no.',
                    controller: _mobile),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  'Gender',
                  style: TextStyle(
                    fontFamily: FontsFamily.inter,
                    fontSize: FontsSize.f14,
                    color: FontsColor.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    Flexible(
                        child: ProfileGenderButton(
                            gender: 'Male',
                            selectedGender: _selectedGender,
                            onTap: () {
                              setState(() {
                                _selectedGender = 'Male';
                              });
                            })),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Flexible(
                        child: ProfileGenderButton(
                            gender: 'Female',
                            selectedGender: _selectedGender,
                            onTap: () {
                              setState(() {
                                _selectedGender = 'Female';
                              });
                            })),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ProfilePageSelectionField(
                  label: 'Date of Birth',
                  hintText: 'Select Date of Birth',
                  controller: _dob,
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ProfilePageSelectionField(
                  label: 'Marriage Anniversary',
                  hintText: 'Select your marriage anniversary',
                  controller: _marriage,
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
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f14,
                              color: FontsColor.black,
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
                              border: Border.all(
                                  color: FontsColor.grey, width: 0.5),
                            ),
                            child: TextFormField(
                              controller: _weight,
                              decoration: InputDecoration(
                                hintText: 'Enter your weight',
                                hintStyle: TextStyle(
                                  fontSize: FontsSize.f14,
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
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Text(
                                    "KG",
                                    style: TextStyle(
                                      fontFamily: FontsFamily.inter,
                                      fontSize: FontsSize.f14,
                                      color: FontsColor.black,
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
                        child: UserDropdownField(
                          label: 'Blood Group',
                          hint: 'Your blood group',
                          value: _bgrp,
                          items: const [
                            'A+',
                            'A-',
                            'B+',
                            'B-',
                            'AB+',
                            'AB-',
                            'O+',
                            'O-'
                          ],
                          onChanged: (value) {
                            setState(() {
                              _bgrp = value!;
                            });
                          },
                        )),
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
