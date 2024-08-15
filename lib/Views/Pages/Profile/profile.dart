import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:progress_alliance/Views/Components/AppBar/fullAppbar.dart';
import 'package:progress_alliance/Views/Pages/Profile/IndividualPage/basicDetail.dart';
import 'package:progress_alliance/Views/Pages/Profile/IndividualPage/dialougeCommon.dart';
import 'package:progress_alliance/Views/Components/ShimmerAnimation/UserProfile/profileShimmer.dart';
import 'package:progress_alliance/Views/Pages/Profile/IndividualPage/familyDetail.dart';
import 'package:progress_alliance/Views/Pages/Profile/IndividualPage/residentailDetail.dart';
import 'package:progress_alliance/Views/Widgets/bottombar.dart';
import 'dart:io';
import 'package:progress_alliance/Routes/route.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with LoadingStateMixin {
  File? _coverImage;
  File? _profileImage;

  Future<void> _pickCoverImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _coverImage = File(pickedFile.path);
      });
    }
  }

  void _showProfileOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const ProfileOption();
      },
    );
  }

  int _selectedIndex = 0;
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, Routes.profileRoute);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, Routes.businessRoute);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        appBar: CustomeAppBar(
          title: "My Profile",
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.businessRoute);
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: MediaQuery.of(context).size.width * 0.06,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: isLoading
              ? const ProfileShimmer()
              : Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.17,
                          color: FontsColor.grey300,
                          child: _coverImage != null
                              ? Image.file(
                                  _coverImage!,
                                  fit: BoxFit.cover,
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 22.0),
                                  child: Text(
                                    "Cover Photo",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FontsFamily.inter,
                                      fontSize: FontsSize.f15,
                                      color: FontsColor.grey600,
                                    ),
                                  ),
                                ),
                        ),
                        Positioned(
                          right: MediaQuery.of(context).size.width * 0.02,
                          top: MediaQuery.of(context).size.width * 0.02,
                          child: GestureDetector(
                            onTap: _pickCoverImage,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.03,
                              backgroundColor: BgColor.black,
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.029,
                                backgroundColor: BgColor.white,
                                child: Icon(
                                  Icons.camera_alt_rounded,
                                  size:
                                      MediaQuery.of(context).size.width * 0.035,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -MediaQuery.of(context).size.width * 0.12,
                          left: MediaQuery.of(context).size.width * 0.33,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.16,
                                backgroundColor: BgColor.white,
                                child: CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.width * 0.156,
                                  backgroundImage: _profileImage != null
                                      ? FileImage(_profileImage!)
                                      : null,
                                  child: _profileImage == null
                                      ? Icon(
                                          Icons.person,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                        )
                                      : null,
                                ),
                              ),
                              Positioned(
                                right: MediaQuery.of(context).size.width * 0.03,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.01,
                                child: GestureDetector(
                                  onTap: () {
                                    _showProfileOptions(context);
                                  },
                                  child: CircleAvatar(
                                    radius: MediaQuery.of(context).size.width *
                                        0.037,
                                    backgroundColor: BgColor.black,
                                    child: CircleAvatar(
                                      radius:
                                          MediaQuery.of(context).size.width *
                                              0.035,
                                      backgroundColor: BgColor.white,
                                      child: Icon(
                                        Icons.camera_alt_rounded,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.035,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Column(
                      children: [
                        Text(
                          "Mr. John Doe",
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f14,
                              fontWeight: FontsWeight.bold),
                        ),
                        Text(
                          "Saral Info Solution",
                          style: TextStyle(
                            fontFamily: FontsFamily.inter,
                            fontSize: FontsSize.f13,
                          ),
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "Membership Id: ",
                            style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f12,
                              color: FontsColor.black,
                              fontWeight: FontsWeight.bold,
                            ),
                          ),
                          TextSpan(
                              text: "PA_Member_Id:07",
                              style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  fontSize: FontsSize.f12,
                                  color: FontsColor.black)),
                        ])),
                        Text(
                          "Saral Info Solution",
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f13,
                              fontWeight: FontsWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          const BasicDetailInfo(
                            gender: '',
                            dob: '',
                            marriage: '',
                            mobile: '',
                            weight: '',
                            bgroup: '',
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.012,
                          ),
                          const RDetailInfo(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.012,
                          ),
                          const FDetailInfo(
                            spouseName: '',
                            spouseDOB: '',
                            emgName: '',
                            emgNumber: '',
                          )
                        ],
                      ),
                    ),
                  ],
                ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
    );
  }
}
