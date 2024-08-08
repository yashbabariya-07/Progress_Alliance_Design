import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

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
          color: isSelected ? Color.fromARGB(255, 16, 2, 90) : Colors.grey[300],
          border: Border.all(width: 1, color: Colors.transparent),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12.sp,
              color: isSelected ? Colors.white : Colors.black,
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
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              color: Colors.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Add Complaints",
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
                        fontFamily: 'Inter',
                        fontSize: 15.sp,
                        color: Color.fromARGB(255, 16, 2, 90),
                        fontWeight: FontWeight.bold,
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
                color: Colors.grey[300],
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
                          fontFamily: 'Inter',
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      child: TextFormField(
                        controller: _description,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Tell us what is your complaint?',
                          hintStyle: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: 'Inter',
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(10),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
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
                          fontFamily: 'Inter',
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
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
                              border:
                                  Border.all(width: 0.5, color: Colors.grey),
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
                                        color: Colors.grey,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                      Text(
                                        "Image 1",
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 13.sp,
                                            color: Colors.grey),
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
                              border:
                                  Border.all(width: 0.5, color: Colors.grey),
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
                                        color: Colors.grey,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                      Text(
                                        "Image 2",
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 13.sp,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ))),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.038,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 16, 2, 90),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
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
