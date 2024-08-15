import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/AppBar/leadingTitleAppBar.dart';
import 'package:progress_alliance/Views/Components/userTextField.dart/customeTextFormField.dart';

class Homesearch extends StatefulWidget {
  const Homesearch({super.key});

  @override
  State<Homesearch> createState() => _HomesearchState();
}

class _HomesearchState extends State<Homesearch> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        appBar: const LeadTitleAppBar(
          title: "What are you looking for?",
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              CustomeSearchField(
                hintText: 'Search by member name, company or products..',
                controller: _searchController,
                onChange: (value) {},
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/Images/search.png",
                    ),
                    Text(
                      "No recent search",
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f15,
                          fontWeight: FontsWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Text("Your search history is empty",
                        style: TextStyle(
                            fontFamily: FontsFamily.inter,
                            fontSize: FontsSize.f12,
                            color: FontsColor.grey600)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
