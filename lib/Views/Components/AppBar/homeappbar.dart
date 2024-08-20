import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:shimmer/shimmer.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarState extends State<HomeAppBar> with LoadingStateMixin {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.width * 0.15,
      backgroundColor: BgColor.white,
      automaticallyImplyLeading: false,
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
      title: Row(
        children: [
          isLoading
              ? Shimmer.fromColors(
                  baseColor: BgColor.grey300!,
                  highlightColor: BgColor.grey100!,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.045,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.profileRoute);
                  },
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.045,
                    child: Icon(
                      Icons.person,
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Expanded(
            child: Text(
              "Hii, John Doe",
              maxLines: 1,
              style: TextStyle(
                fontFamily: FontsFamily.inter,
                fontSize: FontsSize.f15,
                fontWeight: FontsWeight.bold,
                color: FontsColor.purple,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            size: MediaQuery.of(context).size.width * 0.06,
            color: FontsColor.purple,
          ),
          onPressed: () {
            Navigator.pushNamed(context, Routes.homeSearchRoute);
          },
        ),
        IconButton(
          icon: Icon(
            Icons.qr_code,
            size: MediaQuery.of(context).size.width * 0.06,
            color: FontsColor.purple,
          ),
          onPressed: () {
            Navigator.pushNamed(context, Routes.qrRoute);
          },
        ),
        IconButton(
          icon: Icon(
            MdiIcons.bellOutline,
            color: FontsColor.purple,
            size: MediaQuery.of(context).size.width * 0.06,
          ),
          onPressed: () {
            Navigator.pushNamed(context, Routes.notificationRoute);
          },
        ),
      ],
    );
  }
}
