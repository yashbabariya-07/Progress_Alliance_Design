import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:progress_alliance/Views/Components/AppBar/fullAppbar.dart';
import 'package:progress_alliance/Views/Components/ShimmerAnimation/UserProfile/businessShimmer.dart';
import 'package:progress_alliance/Views/Pages/Business/IndividualPage/bAddressInfo.dart';
import 'package:progress_alliance/Views/Pages/Business/IndividualPage/bSocialInfo.dart';
import 'package:progress_alliance/Views/Pages/Business/IndividualPage/bdetailinfo.dart';
import 'package:progress_alliance/Views/Widgets/bottombar.dart';
import 'package:progress_alliance/Routes/route.dart';

class Businessinfo extends StatefulWidget {
  const Businessinfo({
    super.key,
  });

  @override
  State<Businessinfo> createState() => _BusinessinfoState();
}

class _BusinessinfoState extends State<Businessinfo> with LoadingStateMixin {
  File? _logoImage;

  int _selectedIndex = 1;
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

  Future<void> _picklogoImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _logoImage = File(pickedFile.path);
      });
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
          title: "Business Information",
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.profileRoute);
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: MediaQuery.of(context).size.width * 0.06,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: isLoading
                ? const Businessshimmer()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: _picklogoImage,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.32,
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: FontsColor.grey200,
                                  ),
                                  child: _logoImage != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                              fontSize: FontsSize.f15,
                                              color: FontsColor.grey600,
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            const BDetailInfo(
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
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.012,
                            ),
                            const BAddressInfo(
                              shopNumber: '',
                              streetName: '',
                              area: '',
                              landmark: '',
                              pincode: '',
                              state: '',
                              city: '',
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.012,
                            ),
                            const BSocialInfo(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.red[50],
                              ),
                              height: MediaQuery.of(context).size.width * 0.1,
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    MdiIcons.deleteOutline,
                                    color: Colors.red,
                                    size: MediaQuery.of(context).size.width *
                                        0.065,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.006,
                                  ),
                                  Text(
                                    "Delete Business",
                                    style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f13,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
