import 'package:flutter/material.dart';

import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/userTextField.dart/customeTextFormField.dart';
import 'package:progress_alliance/Views/Pages/Business/businessInfo.dart';
import 'package:progress_alliance/Routes/route.dart';

class BusinessAddress extends StatefulWidget {
  const BusinessAddress({super.key});

  @override
  State<BusinessAddress> createState() => _BusinessAddressState();
}

class _BusinessAddressState extends State<BusinessAddress> {
  final TextEditingController _shopNumber = TextEditingController();
  final TextEditingController _streetName = TextEditingController();
  final TextEditingController _area = TextEditingController();
  final TextEditingController _landmark = TextEditingController();
  final TextEditingController _pincode = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _city = TextEditingController();

  void _showState(BuildContext context) {
    TextEditingController _stateSearchController = TextEditingController();
    List<String> _states = ['Gujarat', 'Maharashtra', 'Universal'];
    List<String> _filteredStates = List.from(_states);

    showModalBottomSheet(
      backgroundColor: FontsColor.white,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.008),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select State',
                        style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f16,
                          fontWeight: FontsWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel_rounded,
                          size: MediaQuery.of(context).size.width * 0.06,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.012,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: FontsColor.grey, width: 0.2),
                    ),
                    child: TextField(
                      controller: _stateSearchController,
                      decoration: InputDecoration(
                        labelText: 'Search State.....',
                        labelStyle: TextStyle(
                          fontSize: FontsSize.f14,
                          fontFamily: FontsFamily.inter,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        prefixIcon: Icon(
                          Icons.search,
                          size: MediaQuery.of(context).size.width * 0.06,
                          color: FontsColor.orange,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _filteredStates = _states
                              .where((state) => state
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _filteredStates.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            _filteredStates[index],
                            style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f14,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _state.text = _filteredStates[index];
                            });
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showCity(BuildContext context) {
    TextEditingController _citySearchController = TextEditingController();
    List<String> _citys = [
      'Ahemdabad',
      'Ankleshwar',
      'Bhavnagar',
      'Jetpur',
      'Navsari',
      'Rajkot',
      'Surat',
      'Vadodara',
      'Vapi',
    ];
    List<String> _filteredCities = List.from(_citys);

    showModalBottomSheet(
      backgroundColor: FontsColor.white,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select City',
                        style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f16,
                          fontWeight: FontsWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel_rounded,
                          size: MediaQuery.of(context).size.width * 0.06,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.012,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: FontsColor.grey, width: 0.2),
                    ),
                    child: TextField(
                      controller: _citySearchController,
                      decoration: InputDecoration(
                        labelText: 'Search City.....',
                        labelStyle: TextStyle(
                          fontSize: FontsSize.f14,
                          fontFamily: FontsFamily.inter,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        prefixIcon: Icon(
                          Icons.search,
                          size: MediaQuery.of(context).size.width * 0.06,
                          color: FontsColor.orange,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _filteredCities = _citys
                              .where((city) => city
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _filteredCities.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            _filteredCities[index],
                            style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f14,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _city.text = _filteredCities[index];
                            });
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
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
            "Business Address",
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
                      shopNumber: _shopNumber.text,
                      streetName: _streetName.text,
                      area: _area.text,
                      landmark: _landmark.text,
                      pincode: _pincode.text,
                      state: _state.text,
                      city: _city.text,
                      facebook: '',
                      linkedin: '',
                      instagram: '',
                      youtube: '',
                      google: '',
                    ),
                  ),
                );
              },
              child: Text(
                "Save",
                style: TextStyle(
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f15,
                  color: FontsColor.purple,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                Center(child: PickLocationButton(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.mapRoute);
                  },
                )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                UserCustomTextField(
                  label: "Shop Number",
                  hintText: 'Enter your shop number',
                  controller: _shopNumber,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                UserCustomTextField(
                  label: "Street Name",
                  hintText: 'Enter your street name',
                  controller: _streetName,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: UserCustomTextField(
                        label: 'Area',
                        hintText: 'Enter your area ',
                        controller: _area,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Flexible(
                      flex: 4,
                      child: UserCustomTextField(
                        label: 'Landmark',
                        hintText: 'Enter your landmark',
                        controller: _landmark,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                UserCustomTextField(
                  label: "Pincode",
                  hintText: 'Enter your pincode',
                  controller: _pincode,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Flexible(
                        flex: 4,
                        child: ProfilePageSelectionField(
                          label: 'State',
                          hintText: 'Select your state',
                          controller: _state,
                          onTap: () {
                            _showState(context);
                          },
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Flexible(
                        flex: 4,
                        child: ProfilePageSelectionField(
                          label: 'City',
                          hintText: 'Select your city',
                          controller: _city,
                          onTap: () {
                            _showCity(context);
                          },
                        )),
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
