import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/CommonButton.dart';

class Addcomplaint extends StatefulWidget {
  const Addcomplaint({super.key});

  @override
  State<Addcomplaint> createState() => _AddcomplaintState();
}

class _AddcomplaintState extends State<Addcomplaint> {
  final TextEditingController _description = TextEditingController();
  File? _coverImage;
  File? _coverImage1;
  String selectedCategory = '';

  Future<void> _pickCoverImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _coverImage = File(pickedFile.path);
        _coverImage1 = File(pickedFile.path);
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
          border: Border.all(width: 1, color: FontsColor.transparent),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f12,
              color: isSelected ? FontsColor.white : FontsColor.black,
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: FontsColor.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Add Complaints",
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
            child: Icon(Icons.arrow_back_ios_rounded,
                size: MediaQuery.of(context).size.width * 0.06),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tell us what is your complaint?",
                      style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f15,
                        color: FontsColor.purple,
                        fontWeight: FontsWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.028,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        spacing: MediaQuery.of(context).size.width * 0.03,
                        runSpacing: MediaQuery.of(context).size.height * 0.01,
                        children: [
                          _buildCategoryContainer(
                            "Application Related",
                            MediaQuery.of(context).size.width * 0.38,
                          ),
                          _buildCategoryContainer(
                            "Data Wrong",
                            MediaQuery.of(context).size.width * 0.28,
                          ),
                          _buildCategoryContainer(
                            "Other",
                            MediaQuery.of(context).size.width * 0.18,
                          ),
                          _buildCategoryContainer(
                            "Progress Alliance",
                            MediaQuery.of(context).size.width * 0.38,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.018,
              ),
              Divider(
                thickness: 2,
                color: FontsColor.grey300,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.018,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f13,
                          fontWeight: FontsWeight.bold),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: FontsColor.grey, width: 0.5),
                      ),
                      child: TextFormField(
                        controller: _description,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Tell us what is your complaint?',
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
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
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Row(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.16,
                            width: MediaQuery.of(context).size.width * 0.28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 0.5, color: FontsColor.grey),
                            ),
                            child: _coverImage != null
                                ? Image.file(
                                    _coverImage!,
                                    fit: BoxFit.cover,
                                  )
                                : Center(
                                    child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: FontsColor.grey,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                      Text(
                                        "Image 1",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f13,
                                            color: FontsColor.grey),
                                      ),
                                    ],
                                  ))),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.16,
                            width: MediaQuery.of(context).size.width * 0.28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 0.5, color: FontsColor.grey),
                            ),
                            child: _coverImage1 != null
                                ? Image.file(
                                    _coverImage1!,
                                    fit: BoxFit.cover,
                                  )
                                : Center(
                                    child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: FontsColor.grey,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                      Text(
                                        "Image 2",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f13,
                                            color: FontsColor.grey),
                                      ),
                                    ],
                                  ))),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.038,
                    ),
                    CommonButton(text: "Submit", onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
