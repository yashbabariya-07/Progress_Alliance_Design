import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class Google extends StatefulWidget {
  const Google({super.key});

  @override
  State<Google> createState() => _GoogleState();
}

class _GoogleState extends State<Google> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.width * 0.15,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(
            color: FontsColor.grey,
            height: 1,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
    );
  }
}
