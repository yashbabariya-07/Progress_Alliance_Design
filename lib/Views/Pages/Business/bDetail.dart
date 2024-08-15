import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/AppBar/fullAppbar.dart';
import 'package:progress_alliance/Views/Pages/Business/IndividualPage/businessCategory.dart';
import 'package:progress_alliance/Views/Pages/Business/IndividualPage/businessType.dart';
import 'package:progress_alliance/Views/Components/userTextField.dart/customeTextFormField.dart';
import 'package:progress_alliance/Views/Pages/Business/businessInfo.dart';

class BusinessDetail extends StatefulWidget {
  const BusinessDetail({super.key});

  @override
  State<BusinessDetail> createState() => _BusinessDetailState();
}

class _BusinessDetailState extends State<BusinessDetail> {
  final TextEditingController _cname = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _businessTypeController = TextEditingController();
  final TextEditingController _businessFormationController =
      TextEditingController();
  final TextEditingController _businessCategoryController =
      TextEditingController();
  final TextEditingController _businessSubCategoryController =
      TextEditingController();
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _gstController = TextEditingController();
  final TextEditingController _webURLController = TextEditingController();
  final TextEditingController _businessDescController = TextEditingController();
  File? _bannerImage;
  File? _logoImage;
  bool isValue = false;

  Future<void> _pickBannerImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _bannerImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _picklogoImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _logoImage = File(pickedFile.path);
      });
    }
  }

  void _showBusinessType(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: BgColor.white,
      context: context,
      builder: (BuildContext context) {
        return const BTypeSheet();
      },
    );
  }

  void _showBusinessFormationType(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: BgColor.white,
      context: context,
      builder: (BuildContext context) {
        return const BFormationTypeSheet();
      },
    );
  }

  void _showBusinessCategory(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: BgColor.white,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const BCategorySheet();
      },
    );
  }

  void _showSubBusinessCategory(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: BgColor.white,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const BSubCategorySheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        appBar: CustomeAppBar(
          title: "Business Details",
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Businessinfo(),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserCustomTextField(
                  label: 'Company Name',
                  hintText: 'Enter your company name',
                  controller: _cname,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Primary Business',
                      style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f14,
                        color: FontsColor.black,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: MediaQuery.of(context).size.height * 0.0014,
                            child: Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: FontsColor.white),
                                child: Checkbox(
                                    value: isValue,
                                    onChanged: (value) {
                                      setState(() {
                                        isValue = value!;
                                      });
                                    })),
                          ),
                          Text(
                            "Is this your primary business?",
                            style: TextStyle(
                                fontSize: FontsSize.f14,
                                color: FontsColor.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ProfilePageSelectionField(
                  label: 'Business Established Date',
                  hintText: 'Business established date',
                  controller: _date,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2050),
                    );

                    if (pickedDate != null) {
                      setState(() {
                        _date.text =
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
                      flex: 4,
                      child: ProfilePageSelectionField(
                        label: 'Business Type',
                        hintText: 'Select your business type',
                        controller: _businessTypeController,
                        onTap: () {
                          _showBusinessType(context);
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.015,
                    ),
                    Flexible(
                      flex: 4,
                      child: ProfilePageSelectionField(
                        label: 'Business Formation',
                        hintText: 'Select your business formation',
                        controller: _businessFormationController,
                        onTap: () {
                          _showBusinessFormationType(context);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ProfilePageSelectionField(
                  label: 'Business Category',
                  hintText: 'Select  your business category',
                  controller: _businessCategoryController,
                  onTap: () {
                    _showBusinessCategory(context);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ProfilePageSelectionField(
                  label: 'Business Sub Category',
                  hintText: 'Select  your business category',
                  controller: _businessSubCategoryController,
                  onTap: () {
                    _showSubBusinessCategory(context);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ProfilePageSelectionField(
                  label: 'Product/Service',
                  hintText: 'Select  your products/service',
                  controller: _productController,
                  onTap: () {},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: UserCustomTextField(
                        label: 'Business Email',
                        hintText: 'Enter your email',
                        controller: _emailController,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Flexible(
                      flex: 4,
                      child: UserCustomTextField(
                        label: 'Contact Number',
                        hintText: 'Enter your contact number',
                        controller: _phoneController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                UserCustomTextField(
                  label: "GST Number",
                  hintText: 'Enter your GST number',
                  controller: _gstController,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                UserCustomTextField(
                  label: "Website URL",
                  hintText: 'Enter your website url',
                  controller: _webURLController,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                MaxLineTextField(
                  label: 'Business Description',
                  hintText: 'Enter your business description',
                  controller: _businessDescController,
                  labelFontSize: FontsSize.f14,
                  hintTextFontSize: FontsSize.f14,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Logo",
                        style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f14,
                          color: FontsColor.black,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.006,
                      ),
                      InkWell(
                        onTap: _picklogoImage,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: FontsColor.grey300,
                          ),
                          child: _logoImage != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    _logoImage!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    "+ Add",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FontsFamily.inter,
                                      fontSize: FontsSize.f14,
                                      color: FontsColor.grey600,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Banner",
                      style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f14,
                        color: FontsColor.black,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.006,
                    ),
                    InkWell(
                      onTap: _pickBannerImage,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: FontsColor.grey300,
                        ),
                        child: _bannerImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  _bannerImage!,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Center(
                                child: Text(
                                  "+ Add",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: FontsFamily.inter,
                                    fontSize: FontsSize.f14,
                                    color: FontsColor.grey600,
                                  ),
                                ),
                              ),
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
