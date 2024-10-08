import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/AppBar/fullAppbar.dart';
import 'package:progress_alliance/Views/Pages/Business/IndividualPage/cityState.dart';
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
    showModalBottomSheet(
      backgroundColor: BgColor.white,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return const CitySheet();
          },
        );
      },
    );
  }

  void _showCity(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: BgColor.white,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return const StateSheet();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        appBar: CustomeAppBar(
          title: "Business Address",
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Businessinfo(),
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
