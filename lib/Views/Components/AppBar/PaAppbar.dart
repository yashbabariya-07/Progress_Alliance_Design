import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class PaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.width * 0.15,
      backgroundColor: BgColor.white,
      centerTitle: true,
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Image.asset(
            "assets/Icons/dr.png",
            color: FontsColor.purple,
            width: MediaQuery.of(context).size.width * 0.07,
          ),
        ),
      ),
      titleSpacing: 0,
      title: Text(
        "PA Business",
        style: TextStyle(
          fontFamily: FontsFamily.inter,
          fontSize: FontsSize.f16,
          color: FontsColor.purple,
          fontWeight: FontsWeight.bold,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          color: FontsColor.grey,
          height: MediaQuery.of(context).size.height * 0.0003,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: FontsColor.purple,
              size: MediaQuery.of(context).size.width * 0.06,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
