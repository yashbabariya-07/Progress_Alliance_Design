import 'package:flutter/material.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const CustomeAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: BgColor.white,
      toolbarHeight: MediaQuery.of(context).size.width * 0.15,
      forceMaterialTransparency: true,
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
          Navigator.pushNamed(context, Routes.homeRoute);
        },
        child: Icon(
          Icons.arrow_back_ios_rounded,
          size: MediaQuery.of(context).size.width * 0.06,
        ),
      ),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
