import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/ShimmerLoader/syntax.dart';
import 'package:shimmer/shimmer.dart';

class CityGrowthPartner extends StatefulWidget {
  const CityGrowthPartner({super.key});

  @override
  State<CityGrowthPartner> createState() => _CityGrowthPartnerState();
}

class _CityGrowthPartnerState extends State<CityGrowthPartner>
    with LoadingStateMixin {
  final TextEditingController _SearchController = TextEditingController();

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
            "Growth Partner",
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
            IconButton(
              icon: Icon(
                MdiIcons.downloadOutline,
                size: MediaQuery.of(context).size.width * 0.06,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: isLoading
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.055,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 0.2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 6,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2.5, horizontal: 15),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.087,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 0.2, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.055,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey, width: 0.2),
                      ),
                      child: TextFormField(
                        controller: _SearchController,
                        decoration: InputDecoration(
                          labelText: 'Search by name, company and chapter...',
                          labelStyle: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Inter',
                              color: Colors.grey[700]),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.orange,
                            size: MediaQuery.of(context).size.width * 0.06,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "PA 1 ARJUN",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.2,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.06,
                              backgroundColor: Colors.green,
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.058,
                                child: Icon(
                                  Icons.person,
                                  size:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Person 1 Name ",
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Yoyo Fashion India Pvt Ltd",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Colors.grey,
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/wp.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.015,
                                ),
                                Icon(
                                  MdiIcons.phoneOutline,
                                  color: Colors.grey[500],
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.015,
                                ),
                                Icon(
                                  MdiIcons.accountPlusOutline,
                                  color: Colors.grey[500],
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.2,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.06,
                              backgroundColor: Colors.blue,
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.058,
                                child: Icon(
                                  Icons.person,
                                  size:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Person 2 Name ",
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Saral InfoTech Pvt Ltd",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Colors.grey,
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/wp.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.015,
                                ),
                                Icon(
                                  MdiIcons.phoneOutline,
                                  color: Colors.grey[500],
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.015,
                                ),
                                Icon(
                                  MdiIcons.accountPlusOutline,
                                  color: Colors.grey[500],
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "PA 2 LAKSHYA",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.2,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.06,
                              backgroundColor: Colors.green,
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.058,
                                child: Icon(
                                  Icons.person,
                                  size:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Person 3 Name ",
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Manshav Infosoft Solution",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Colors.grey,
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/wp.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.015,
                                ),
                                Icon(
                                  MdiIcons.phoneOutline,
                                  color: Colors.grey[500],
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.015,
                                ),
                                Icon(
                                  MdiIcons.accountPlusOutline,
                                  color: Colors.grey[500],
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.2,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.06,
                              backgroundColor: Colors.blue,
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.058,
                                child: Icon(
                                  Icons.person,
                                  size:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Person 4 Name ",
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Perfect Door And Window",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Colors.grey,
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/wp.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.015,
                                ),
                                Icon(
                                  MdiIcons.phoneOutline,
                                  color: Colors.grey[500],
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.015,
                                ),
                                Icon(
                                  MdiIcons.accountPlusOutline,
                                  color: Colors.grey[500],
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10),
                  //   child: Container(
                  //     height: MediaQuery.of(context).size.height * 0.1,
                  //     width: double.infinity,
                  //     decoration: BoxDecoration(
                  //       border: Border.all(
                  //         width: 0.5,
                  //         color: Colors.grey,
                  //       ),
                  //       borderRadius: BorderRadius.circular(5),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(10),
                  //       child: Row(
                  //         children: [
                  //           CircleAvatar(
                  //             radius: MediaQuery.of(context).size.width * 0.06,
                  //             backgroundColor: Colors.green,
                  //             child: CircleAvatar(
                  //               radius: MediaQuery.of(context).size.width * 0.058,
                  //               child: Icon(
                  //                 Icons.person,
                  //                 size: MediaQuery.of(context).size.width * 0.08,
                  //               ),
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: MediaQuery.of(context).size.width * 0.05,
                  //           ),
                  //           Expanded(
                  //             child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   "Person 5 Name ",
                  //                   style: TextStyle(
                  //                       fontFamily: 'Inter', fontSize: 16.sp),
                  //                 ),
                  //                 Flexible(
                  //                   child: Text(
                  //                     "Omkaleshwar Textile",
                  //                     maxLines: 1,
                  //                     overflow: TextOverflow.ellipsis,
                  //                     style: TextStyle(
                  //                         fontFamily: 'Inter',
                  //                         color: Colors.grey,
                  //                         fontSize: 14.sp),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: MediaQuery.of(context).size.width * 0.03,
                  //           ),
                  //           Row(
                  //             children: [
                  //               Image.asset(
                  //                 "assets/wp.png",
                  //                 width: MediaQuery.of(context).size.width * 0.07,
                  //               ),
                  //               SizedBox(
                  //                 width: MediaQuery.of(context).size.width * 0.015,
                  //               ),
                  //               Icon(
                  //                 Icons.call,
                  //                 size: MediaQuery.of(context).size.width * 0.06,
                  //               ),
                  //               SizedBox(
                  //                 width: MediaQuery.of(context).size.width * 0.015,
                  //               ),
                  //               Icon(
                  //                 Icons.person,
                  //                 size: MediaQuery.of(context).size.width * 0.06,
                  //               ),
                  //             ],
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
      ),
    );
  }
}
