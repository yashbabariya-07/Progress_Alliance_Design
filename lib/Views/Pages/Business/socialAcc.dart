import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_alliance/Views/Pages/Business/businessInfo.dart';

class SocialAccount extends StatefulWidget {
  const SocialAccount({super.key});

  @override
  State<SocialAccount> createState() => _SocialAccountState();
}

class _SocialAccountState extends State<SocialAccount> {
  final TextEditingController _facbook = TextEditingController();
  final TextEditingController _linkedin = TextEditingController();
  final TextEditingController _instagram = TextEditingController();
  final TextEditingController _twitter = TextEditingController();
  final TextEditingController _youtube = TextEditingController();
  final TextEditingController _google = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            forceMaterialTransparency: true,
            toolbarHeight: MediaQuery.of(context).size.width * 0.15,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                color: Colors.grey,
                height: 0.2,
              ),
            ),
            centerTitle: true,
            title: Text(
              "Social Accounts",
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
                      builder: (context) => Businessinfo(
                        name: '',
                        type: '',
                        category: '',
                        subCategory: '',
                        product: '',
                        gstNo: '',
                        number: '',
                        email: '',
                        website: '',
                        teamSize: '',
                        formation: '',
                        establish: '',
                        about: '',
                        logoImage: null,
                        bannerImage: null,
                        shopNumber: '',
                        streetName: '',
                        area: '',
                        landmark: '',
                        pincode: '',
                        state: '',
                        city: '',
                        facebook: _facbook.text,
                        linkedin: _linkedin.text,
                        instagram: _instagram.text,
                        youtube: _youtube.text,
                        google: _google.text,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Facebook Link",
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
                          controller: _facbook,
                          decoration: InputDecoration(
                            hintText: 'Enter facebook link',
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Linkedin Link",
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
                          controller: _linkedin,
                          decoration: InputDecoration(
                            hintText: 'Enter linkedin link',
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Instagram Link",
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
                          controller: _instagram,
                          decoration: InputDecoration(
                            hintText: 'Enter instagram link',
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Twitter Link",
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
                          controller: _twitter,
                          decoration: InputDecoration(
                            hintText: 'Enter twitter link',
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Youtube Link",
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
                          controller: _youtube,
                          decoration: InputDecoration(
                            hintText: 'Enter youtube link',
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Google Business Link",
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
                          controller: _google,
                          decoration: InputDecoration(
                            hintText: 'Enter google business link',
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
                ],
              ),
            ),
          )),
    );
  }
}
