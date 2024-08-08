import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

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
          color: isSelected ? Color.fromARGB(255, 16, 2, 90) : Colors.grey[300],
          border: Border.all(
            width: 1,
            color: isSelected ? Colors.transparent : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.grey[700],
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
            "Feedback & Review",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16.sp,
              color: Color.fromARGB(255, 16, 2, 90),
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
                    fontFamily: 'Inter',
                    fontSize: 15.sp,
                    color: Color.fromARGB(255, 16, 2, 90),
                    fontWeight: FontWeight.bold,
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
                    fontFamily: 'Inter',
                    fontSize: 14.sp,
                    color: const Color.fromARGB(255, 16, 2, 90),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.003,
                ),
                Text(
                  "Are you satisfied with service?",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12.sp,
                      color: Colors.grey[700]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                RatingBar(
                  glow: false,
                  initialRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  unratedColor: Colors.grey,
                  itemCount: 5,
                  itemSize: 27,
                  itemPadding: EdgeInsets.symmetric(horizontal: 3),
                  ratingWidget: RatingWidget(
                    full: Image.asset('assets/ostar.png'),
                    empty: Image.asset('assets/bstar.png'),
                    half: Image.asset('assets/ostar.png'),
                  ),
                  onRatingUpdate: (rating) {},
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Column(
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
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
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
                          hintText: 'Tell us how we can improve...',
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
                                  unselectedWidgetColor: Colors.white),
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
                              fontFamily: 'Inter',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold),
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
                              fontFamily: 'Inter',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold),
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
                              color: Colors.grey[300],
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
                                              fontFamily: 'Inter',
                                              fontSize: 13.sp),
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
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 16, 2, 90),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.white,
                              fontSize: 20.sp,
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
