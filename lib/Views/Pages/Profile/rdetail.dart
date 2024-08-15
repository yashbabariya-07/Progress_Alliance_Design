import 'package:flutter/material.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/AppBar/fullAppbar.dart';
import 'package:progress_alliance/Views/Components/userTextField.dart/customeTextFormField.dart';

class ResidentialDetail extends StatefulWidget {
  const ResidentialDetail({super.key});

  @override
  State<ResidentialDetail> createState() => _ResidentialDetailState();
}

class _ResidentialDetailState extends State<ResidentialDetail> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        appBar: CustomeAppBar(
          title: "Residential Details",
          actions: [
            TextButton(
              onPressed: () {},
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
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Center(child: PickLocationButton(
              onTap: () {
                Navigator.pushNamed(context, Routes.mapRoute);
              },
            )),
          ],
        ),
      ),
    );
  }
}
