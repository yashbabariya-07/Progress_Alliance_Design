import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/Button/CommonButton.dart';
import 'package:progress_alliance/Views/Components/AppBar/leadingTitleAppBar.dart';
import 'package:progress_alliance/Views/Components/userTextField.dart/customeTextFormField.dart';
import 'package:progress_alliance/Views/Pages/Business/IndividualPage/businessCategory.dart';

class AskPage extends StatefulWidget {
  const AskPage({super.key});

  @override
  State<AskPage> createState() => _AskPageState();
}

class _AskPageState extends State<AskPage> {
  String selected = "";
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _businessCategoryController =
      TextEditingController();
  final TextEditingController _description = TextEditingController();

  Widget _buildContainer(String label, Color color) {
    bool isSelected = selected == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = isSelected ? "" : label;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.045,
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          color: isSelected ? color : FontsColor.transparent,
          border: Border.all(
              width: 1,
              color: isSelected ? FontsColor.transparent : FontsColor.grey),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f13,
              fontWeight: isSelected ? FontsWeight.bold : FontWeight.normal,
              color: isSelected ? FontsColor.white : FontsColor.black,
            ),
          ),
        ),
      ),
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

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        appBar: const LeadTitleAppBar(
          title: "Add Ask",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                CustomeSearchField(
                  hintText: 'Search by product and service',
                  controller: _searchController,
                  onChange: (value) {},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Business Category",
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
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
                        border: Border.all(color: FontsColor.grey, width: 0.5),
                      ),
                      child: InkWell(
                        onTap: () {
                          _showBusinessCategory(context);
                        },
                        child: IgnorePointer(
                          child: TextFormField(
                            controller: _businessCategoryController,
                            decoration: InputDecoration(
                              hintText: 'select category',
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
                                Icons.arrow_forward_ios_rounded,
                                color: FontsColor.grey,
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
                MaxLineTextField(
                  label: "Description",
                  hintText: 'Write brief description for your ask....',
                  controller: _description,
                  labelFontSize: FontsSize.f13,
                  hintTextFontSize: FontsSize.f13,
                  labelWeight: FontsWeight.bold,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Time Duration",
                    style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f13,
                        fontWeight: FontsWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: MediaQuery.of(context).size.width * 0.03,
                    runSpacing: MediaQuery.of(context).size.height * 0.015,
                    children: [
                      _buildContainer("Inquiry", FontsColor.green),
                      _buildContainer("Urgent", Colors.red),
                      _buildContainer("In 1 Month", FontsColor.blue),
                      _buildContainer("In 2 Month", FontsColor.orange),
                      _buildContainer("In 3 Month", FontsColor.yellow),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                CommonButton(text: "Submit", onTap: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
