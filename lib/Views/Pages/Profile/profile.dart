import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:progress_alliance/Views/Widgets/bottombar.dart';
import 'dart:io';
import 'package:progress_alliance/Routes/route.dart';
import 'package:shimmer/shimmer.dart';

class Profile extends StatefulWidget {
  final String gender;
  final String dob;
  final String marriage;
  final String mobile;
  final String weight;
  final String bgroup;
  final String spouseName;
  final String spouseDOB;
  final String emgName;
  final String emgNumber;

  const Profile(
      {super.key,
      required this.gender,
      required this.dob,
      required this.marriage,
      required this.mobile,
      required this.weight,
      required this.bgroup,
      required this.spouseName,
      required this.spouseDOB,
      required this.emgName,
      required this.emgNumber});

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

  Future<void> _pickProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _showProfileOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Profile Photo',
                style: TextStyle(
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f16,
                  fontWeight: FontsWeight.bold,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.remove_red_eye,
                  size: MediaQuery.of(context).size.width * 0.06,
                ),
                title: Text(
                  'View Profile',
                  style: TextStyle(
                      fontWeight: FontsWeight.bold,
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f14),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickProfileImage();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.note_alt_outlined,
                  size: MediaQuery.of(context).size.width * 0.06,
                ),
                title: Text(
                  'Change Profile',
                  style: TextStyle(
                      fontWeight: FontsWeight.bold,
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f14),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickProfileImage();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.delete,
                  size: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.red,
                ),
                title: Text(
                  'Remove Profile',
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: FontsFamily.inter,
                    fontSize: FontsSize.f14,
                    fontWeight: FontsWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _profileImage = null;
                  });
                },
              ),
            ],
          ),
        );
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

  List<Map<String, String>> children = [];

  void _addChild() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final nameController = TextEditingController();
        final dobController = TextEditingController();
        String _gender = 'Boy';

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: FontsColor.white,
              title: Text(
                'Add Child',
                style: TextStyle(
                    fontFamily: FontsFamily.inter,
                    fontSize: FontsSize.f18,
                    fontWeight: FontsWeight.bold),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f14,
                        )),
                  ),
                  TextField(
                    controller: dobController,
                    decoration: InputDecoration(
                        labelText: 'DOB',
                        labelStyle: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f14,
                        )),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2010),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          dobController.text =
                              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.062,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: DropdownButtonFormField<String>(
                      iconSize: MediaQuery.of(context).size.width * 0.06,
                      style: TextStyle(
                        fontSize: FontsSize.f14,
                        fontFamily: FontsFamily.inter,
                        color: FontsColor.black,
                      ),
                      value: _gender,
                      items: [
                        'Boy',
                        'Girl',
                      ]
                          .map((gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Select Gender',
                        hintStyle: TextStyle(
                          fontSize: FontsSize.f14,
                          fontFamily: FontsFamily.inter,
                        ),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
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
              actions: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: const Text('Add'),
                  onPressed: () {
                    setState(() {
                      children.add({
                        'name': nameController.text,
                        'dob': dobController.text,
                        'gender': _gender,
                      });
                    });
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _editChild(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final nameController =
            TextEditingController(text: children[index]['name']);
        final dobController =
            TextEditingController(text: children[index]['dob']);
        String _gender = children[index]['gender'] ?? 'Girl';

        return AlertDialog(
          backgroundColor: FontsColor.white,
          title: Text(
            'Edit Child',
            style: TextStyle(
                fontFamily: FontsFamily.inter,
                fontSize: FontsSize.f18,
                fontWeight: FontsWeight.bold),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f14,
                    )),
              ),
              TextField(
                controller: dobController,
                decoration: InputDecoration(
                    labelText: 'DOB',
                    labelStyle: TextStyle(
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f14,
                    )),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2010),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    dobController.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.062,
                width: MediaQuery.of(context).size.width * 0.25,
                child: DropdownButtonFormField<String>(
                  iconSize: MediaQuery.of(context).size.width * 0.06,
                  style: TextStyle(
                    fontSize: FontsSize.f14,
                    fontFamily: FontsFamily.inter,
                    color: FontsColor.black,
                  ),
                  value: _gender,
                  items: [
                    'Boy',
                    'Girl',
                  ]
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Select Gender',
                    hintStyle: TextStyle(
                      fontSize: FontsSize.f14,
                      fontFamily: FontsFamily.inter,
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
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
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  children[index] = {
                    'name': nameController.text,
                    'dob': dobController.text,
                    'gender': _gender,
                  };
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: FontsColor.white,
        appBar: AppBar(
          backgroundColor: FontsColor.white,
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          forceMaterialTransparency: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              color: FontsColor.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "My Profile",
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f16,
              color: FontsColor.purple,
              fontWeight: FontsWeight.bold,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.homeRoute);
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
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
              ? Shimmer.fromColors(
                  baseColor: FontsColor.grey300!,
                  highlightColor: FontsColor.grey100!,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: FontsColor.grey200),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                            width: MediaQuery.of(context).size.width * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: FontsColor.grey200),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.002,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: FontsColor.grey200),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.002,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                            width: MediaQuery.of(context).size.width * 0.55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: FontsColor.grey200),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.002,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: FontsColor.grey200),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: FontsColor.grey200),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.012,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: FontsColor.grey200),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.012,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: FontsColor.grey200),
                        ),
                      ),
                    ],
                  ),
                )
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
                              backgroundColor: FontsColor.black,
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.029,
                                backgroundColor: FontsColor.white,
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
                                backgroundColor: FontsColor.white,
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
                                    backgroundColor: FontsColor.black,
                                    child: CircleAvatar(
                                      radius:
                                          MediaQuery.of(context).size.width *
                                              0.035,
                                      backgroundColor: FontsColor.white,
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
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 0.2, color: FontsColor.grey),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Basic Detail",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f15,
                                            color: const Color.fromARGB(
                                                255, 16, 2, 90),
                                            fontWeight: FontsWeight.bold),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                Routes.basicDetailRoute);
                                          },
                                          child: CircleAvatar(
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.035,
                                            backgroundColor: FontsColor.grey300,
                                            child: Center(
                                              child: Icon(
                                                MdiIcons.pencilOutline,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.045,
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.018,
                                  ),
                                  Text("Gender",
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f12,
                                          color: FontsColor.grey)),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.006,
                                  ),
                                  Text(
                                    widget.gender,
                                    style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                        fontWeight: FontsWeight.bold),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.012,
                                  ),
                                  Text("Date of Birth",
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f12,
                                          color: FontsColor.grey)),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.006,
                                  ),
                                  Text(
                                    widget.dob,
                                    style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                        fontWeight: FontsWeight.bold),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.012,
                                  ),
                                  Text("Marriage Anniversary",
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f12,
                                          color: FontsColor.grey)),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.006,
                                  ),
                                  Text(
                                    widget.marriage,
                                    style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                        fontWeight: FontsWeight.bold),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.012,
                                  ),
                                  Text("Mobile Number",
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f12,
                                          color: FontsColor.grey)),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.006,
                                  ),
                                  Text(
                                    widget.mobile,
                                    style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                        fontWeight: FontsWeight.bold),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.012,
                                  ),
                                  Text("Weight",
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f12,
                                          color: FontsColor.grey)),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.006,
                                  ),
                                  Text(
                                    widget.weight,
                                    style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                        fontWeight: FontsWeight.bold),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.012,
                                  ),
                                  Text("Blood Group",
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f12,
                                          color: FontsColor.grey)),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.006,
                                  ),
                                  Text(
                                    widget.bgroup,
                                    style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                        fontWeight: FontsWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.012,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 0.2, color: FontsColor.grey),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Residential Details",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f15,
                                            color: const Color.fromARGB(
                                                255, 16, 2, 90),
                                            fontWeight: FontsWeight.bold),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, Routes.locationRoute);
                                          },
                                          child: CircleAvatar(
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.035,
                                            backgroundColor: FontsColor.grey300,
                                            child: Center(
                                              child: Icon(
                                                MdiIcons.pencilOutline,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.045,
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.018,
                                  ),
                                  Text("Address",
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f12,
                                          color: FontsColor.grey)),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.006,
                                  ),
                                  Text(
                                    "your address",
                                    style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                        fontWeight: FontsWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.012,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 0.2, color: FontsColor.grey),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Family Details",
                                        style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f15,
                                            color: const Color.fromARGB(
                                                255, 16, 2, 90),
                                            fontWeight: FontsWeight.bold),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                Routes.familyDetailRoute);
                                          },
                                          child: CircleAvatar(
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.035,
                                            backgroundColor: FontsColor.grey300,
                                            child: Center(
                                              child: Icon(
                                                MdiIcons.pencilOutline,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.045,
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.018,
                                  ),
                                  Text("Spouse Name",
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f12,
                                          color: FontsColor.grey)),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.006,
                                  ),
                                  Text(
                                    widget.spouseName,
                                    style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                        fontWeight: FontsWeight.bold),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.012,
                                  ),
                                  Text("Spouse Date of Birth",
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f12,
                                          color: FontsColor.grey)),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.006,
                                  ),
                                  Text(
                                    widget.spouseDOB,
                                    style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                        fontWeight: FontsWeight.bold),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.006,
                                  ),
                                  Text('Children',
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f12,
                                          color: FontsColor.grey)),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.006,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: FontsColor.grey, width: 0.5),
                                    ),
                                    child: Table(
                                      border: TableBorder.all(
                                          color: FontsColor.grey, width: 0.5),
                                      children: [
                                        TableRow(
                                          children: [
                                            TableCell(
                                                child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Center(
                                                  child: Text(
                                                'Name',
                                                style: TextStyle(
                                                  fontFamily: FontsFamily.inter,
                                                  fontSize: FontsSize.f13,
                                                  fontWeight: FontsWeight.bold,
                                                  color: const Color.fromARGB(
                                                      255, 16, 2, 90),
                                                ),
                                              )),
                                            )),
                                            TableCell(
                                                child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Center(
                                                  child: Text(
                                                'DOB',
                                                style: TextStyle(
                                                  fontFamily: FontsFamily.inter,
                                                  fontSize: FontsSize.f13,
                                                  fontWeight: FontsWeight.bold,
                                                  color: const Color.fromARGB(
                                                      255, 16, 2, 90),
                                                ),
                                              )),
                                            )),
                                            TableCell(
                                                child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Center(
                                                  child: Text(
                                                'Gender',
                                                style: TextStyle(
                                                  fontFamily: FontsFamily.inter,
                                                  fontWeight: FontsWeight.bold,
                                                  fontSize: FontsSize.f13,
                                                  color: const Color.fromARGB(
                                                      255, 16, 2, 90),
                                                ),
                                              )),
                                            )),
                                            TableCell(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: GestureDetector(
                                                      onTap: _addChild,
                                                      child: Icon(
                                                        Icons.add,
                                                        size: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.06,
                                                      )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        for (int i = 0;
                                            i < children.length;
                                            i++)
                                          TableRow(
                                            children: [
                                              TableCell(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Center(
                                                    child: Text(
                                                      children[i]['name'] ?? '',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            FontsFamily.inter,
                                                        fontSize: FontsSize.f13,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              TableCell(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Center(
                                                    child: Text(
                                                      children[i]['dob'] ?? '',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            FontsFamily.inter,
                                                        fontSize: FontsSize.f13,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              TableCell(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Center(
                                                    child: Text(
                                                      children[i]['gender'] ??
                                                          '',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            FontsFamily.inter,
                                                        fontSize: FontsSize.f13,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              TableCell(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      GestureDetector(
                                                          onTap: () =>
                                                              _editChild(i),
                                                          child: Icon(
                                                            Icons.edit,
                                                            size: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.06,
                                                          )),
                                                      SizedBox(width: 5),
                                                      GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              children
                                                                  .removeAt(i);
                                                            });
                                                          },
                                                          child: Icon(
                                                            Icons.delete,
                                                            size: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.06,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.006,
                                  ),
                                  Text("Emergency Person's Name",
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f12,
                                          color: FontsColor.grey)),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.006,
                                  ),
                                  Text(
                                    widget.emgName,
                                    style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                        fontWeight: FontsWeight.bold),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.012,
                                  ),
                                  Text("Emergency Person's Number",
                                      style: TextStyle(
                                          fontFamily: FontsFamily.inter,
                                          fontSize: FontsSize.f12,
                                          color: FontsColor.grey)),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.006,
                                  ),
                                  Text(
                                    widget.emgNumber,
                                    style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f14,
                                        fontWeight: FontsWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
