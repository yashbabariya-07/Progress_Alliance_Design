import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:image_picker/image_picker.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/CommonButton.dart';
import 'package:progress_alliance/Views/Components/userTextField.dart/customeTextFormField.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _description = TextEditingController();
  File? _coverImage;
  String selectedCategory = '';
  bool isValue = false;

  Future<void> _pickCoverImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _coverImage = File(pickedFile.path);
      });
    }
  }

  Widget _buildCategoryContainer(String text, double width) {
    bool isSelected = selectedCategory == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = text;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.045,
        width: width,
        decoration: BoxDecoration(
          color: isSelected ? FontsColor.purple : FontsColor.grey300,
          border: Border.all(
            width: 1,
            color: isSelected ? FontsColor.transparent : FontsColor.transparent,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f12,
              fontWeight: FontsWeight.bold,
              color: isSelected ? FontsColor.white : FontsColor.grey700,
            ),
          ),
        ),
      ),
    );
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: FontsColor.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Feedback & Review",
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f16,
              color: FontsColor.purple,
              fontWeight: FontsWeight.bold,
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
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 28, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tell us what can be improved?",
                  style: TextStyle(
                    fontFamily: FontsFamily.inter,
                    fontSize: FontsSize.f15,
                    color: FontsColor.purple,
                    fontWeight: FontsWeight.bold,
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
                    runSpacing: MediaQuery.of(context).size.height * 0.01,
                    children: [
                      _buildCategoryContainer(
                        "Overall Services",
                        MediaQuery.of(context).size.width * 0.35,
                      ),
                      _buildCategoryContainer(
                        "Meetings",
                        MediaQuery.of(context).size.width * 0.25,
                      ),
                      _buildCategoryContainer(
                        "Programs",
                        MediaQuery.of(context).size.width * 0.25,
                      ),
                      _buildCategoryContainer(
                        "Applications",
                        MediaQuery.of(context).size.width * 0.25,
                      ),
                      _buildCategoryContainer(
                        "Member",
                        MediaQuery.of(context).size.width * 0.25,
                      ),
                      _buildCategoryContainer(
                        "Growth Partner",
                        MediaQuery.of(context).size.width * 0.35,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  "Rate Your Experience",
                  style: TextStyle(
                    fontFamily: FontsFamily.inter,
                    fontSize: FontsSize.f14,
                    color: FontsColor.purple,
                    fontWeight: FontsWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.003,
                ),
                Text(
                  "Are you satisfied with service?",
                  style: TextStyle(
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f12,
                      color: FontsColor.grey700),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                RatingBar(
                  glow: false,
                  initialRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  unratedColor: FontsColor.grey,
                  itemCount: 5,
                  itemSize: 27,
                  itemPadding: EdgeInsets.symmetric(horizontal: 3),
                  ratingWidget: RatingWidget(
                    full: Image.asset('assets/Images/ostar.png'),
                    empty: Image.asset('assets/Images/bstar.png'),
                    half: Image.asset('assets/Images/ostar.png'),
                  ),
                  onRatingUpdate: (rating) {},
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaxLineTextField(
                      label: "Description",
                      hintText: 'Tell us how we can improve....',
                      controller: _description,
                      labelFontSize: FontsSize.f13,
                      hintTextFontSize: FontsSize.f13,
                      labelWeight: FontsWeight.bold,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 30),
                          child: Transform.scale(
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
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Text(
                          "Don't show my identity?",
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f13,
                              fontWeight: FontsWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.012,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Attach Images (Optional)",
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f13,
                              fontWeight: FontsWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.012,
                        ),
                        GestureDetector(
                          onTap: _pickCoverImage,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.17,
                            width: MediaQuery.of(context).size.height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: FontsColor.grey300,
                            ),
                            child: _coverImage != null
                                ? Image.file(
                                    _coverImage!,
                                    fit: BoxFit.cover,
                                  )
                                : Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add),
                                        Text(
                                          "Add Image",
                                          style: TextStyle(
                                              fontFamily: FontsFamily.inter,
                                              fontSize: FontsSize.f13),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.038,
                    ),
                    CommonButton(text: "Submit", onTap: () {}),
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
