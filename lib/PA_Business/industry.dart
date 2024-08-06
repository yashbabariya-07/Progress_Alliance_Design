import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_alliance/ShimmerLoader/syntax.dart';
import 'package:progress_alliance/routes/route.dart';
import 'package:shimmer/shimmer.dart';

class Retailer extends StatefulWidget {
  const Retailer({super.key});

  @override
  State<Retailer> createState() => _RetailerState();
}

class _RetailerState extends State<Retailer> with LoadingStateMixin {
  final ValueNotifier<String> _searchQuery = ValueNotifier<String>("");
  final picker = ImagePicker();

  Future<File?> _pickProfile() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  List<Map<String, dynamic>> retailer = [
    {
      "name": "Mansoft",
      "work": "Computer & CCTV",
      "owner": "Praful Desai",
      "address": "123 Tech Street, Silicon Valley",
      "profileImage": null,
    },
    {
      "name": "Otlo The Cafe By Maheshivaay Enterprise",
      "work": "Food",
      "owner": "Monik Patel",
      "address": "123 Tech Street, Silicon Valley, tornito canada",
      "profileImage": null,
    },
  ];

  final List<String> categories = [
    'Advertising Services',
    'Agriculture & Agro',
    'Automobiles',
    'Chemicals',
    'Ecommerce',
    'SEO',
    'Software Development',
    'Standard Software',
    'Tally Accounting Software',
    'Web Design & Development',
  ];

  final Set<String> selectedCategories = {};

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          backgroundColor: Colors.white,
          centerTitle: true,
          titleSpacing: 0,
          title: Text(
            "Retailer",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16.sp,
              color: const Color.fromARGB(255, 16, 2, 90),
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              color: Colors.grey,
              height: 0.2,
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
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(
                    Icons.more_vert,
                    size: MediaQuery.of(context).size.width * 0.06,
                  ),
                );
              },
            ),
          ],
        ),
        endDrawer: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width * 0.68,
          child: Drawer(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      color: const Color.fromARGB(255, 16, 2, 90),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Divider(
                    thickness: 0.5,
                  ),
                  Expanded(
                    child: ValueListenableBuilder<String>(
                      valueListenable: _searchQuery,
                      builder: (context, query, child) {
                        final filteredCategories = categories.where((category) {
                          return category
                              .toLowerCase()
                              .contains(query.toLowerCase());
                        }).toList();
                        return ListView.builder(
                          itemCount: filteredCategories.length,
                          itemBuilder: (context, index) {
                            final category = filteredCategories[index];
                            return ListTile(
                              // contentPadding:
                              //     const EdgeInsets.symmetric(horizontal: 0),
                              leading: Transform.scale(
                                scale:
                                    MediaQuery.of(context).size.height * 0.0014,
                                child: Checkbox(
                                  value: selectedCategories.contains(category),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (value == true) {
                                        selectedCategories.add(category);
                                      } else {
                                        selectedCategories.remove(category);
                                      }
                                    });
                                  },
                                ),
                              ),
                              title: Text(
                                category,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                setState(() {
                                  if (selectedCategories.contains(category)) {
                                    selectedCategories.remove(category);
                                  } else {
                                    selectedCategories.add(category);
                                  }
                                });
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: selectedCategories.isEmpty
                        ? Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width: MediaQuery.of(context).size.width * 0.28,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color.fromARGB(255, 16, 2, 90),
                                ),
                                child: Center(
                                  child: Text(
                                    'Apply',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCategories.clear();
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  width:
                                      MediaQuery.of(context).size.width * 0.28,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 16, 2, 90)),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Reset',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 15.sp,
                                        color: const Color.fromARGB(
                                            255, 16, 2, 90),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  width:
                                      MediaQuery.of(context).size.width * 0.28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color.fromARGB(255, 16, 2, 90),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Apply',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 15.sp,
                                        color: Colors.white,
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
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: ListView.builder(
            itemCount: retailer.length,
            itemBuilder: (context, index) {
              final retailers = retailer[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.memberDetailRoute);
                },
                child: isLoading
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(bottom: 5),
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 0.2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ))
                    : Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: InkWell(
                                  onTap: () async {
                                    final profile = await _pickProfile();
                                    if (profile != null) {
                                      setState(() {
                                        retailer[index]['profileImage'] =
                                            profile;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300],
                                    ),
                                    child: retailers['profileImage'] != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.file(
                                              retailers['profileImage'],
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : Center(
                                            child: Text(
                                              "+",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 20.sp,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.03,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      retailers['name'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 13.sp,
                                          color: const Color.fromARGB(
                                              255, 16, 2, 90),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      retailers['work'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 12.sp,
                                        color: const Color.fromARGB(
                                            255, 16, 2, 90),
                                      ),
                                    ),
                                    Text(
                                      retailers['owner'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 12.sp,
                                          color: Colors.grey[900]),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.003,
                                    ),
                                    Text(
                                      retailers['address'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 12.sp,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
