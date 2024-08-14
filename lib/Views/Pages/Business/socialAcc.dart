import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/userTextField.dart/customeTextFormField.dart';
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
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
          backgroundColor: FontsColor.white,
          appBar: AppBar(
            forceMaterialTransparency: true,
            toolbarHeight: MediaQuery.of(context).size.width * 0.15,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                color: FontsColor.grey,
                height: 0.2,
              ),
            ),
            centerTitle: true,
            title: Text(
              "Social Accounts",
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserCustomTextField(
                    label: "Facebook Link",
                    hintText: 'Enter facebook link',
                    controller: _facbook,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  UserCustomTextField(
                    label: "Linkedin Link",
                    hintText: 'Enter linkedin link',
                    controller: _linkedin,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  UserCustomTextField(
                    label: "Instagram Link",
                    hintText: 'Enter instagram link',
                    controller: _instagram,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  UserCustomTextField(
                    label: "Twitter Link",
                    hintText: 'Enter twitter link',
                    controller: _twitter,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  UserCustomTextField(
                    label: "Youtube Link",
                    hintText: 'Enter youtube link',
                    controller: _youtube,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  UserCustomTextField(
                    label: "Google Business Link",
                    hintText: 'Enter google business link',
                    controller: _google,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
