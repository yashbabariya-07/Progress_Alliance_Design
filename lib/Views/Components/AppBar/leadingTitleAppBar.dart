import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class LeadTitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const LeadTitleAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: BgColor.white,
      toolbarHeight: MediaQuery.of(context).size.width * 0.16,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          color: FontsColor.grey,
          height: MediaQuery.of(context).size.height * 0.0003,
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
