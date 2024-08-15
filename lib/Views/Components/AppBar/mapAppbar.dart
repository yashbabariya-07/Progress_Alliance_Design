import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class MapAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MapAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: BgColor.white,
      toolbarHeight: MediaQuery.of(context).size.width * 0.15,
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          color: FontsColor.grey,
          height: MediaQuery.of(context).size.height * 0.0003,
        ),
      ),
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
      title: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.searchPlaceRoute);
        },
        child: Row(
          children: [
            Icon(
              MdiIcons.mapMarkerOutline,
              color: FontsColor.orange,
              size: MediaQuery.of(context).size.height * 0.04,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.008,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Area Name",
                      style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f14,
                          fontWeight: FontsWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: FontsColor.purple,
                      size: MediaQuery.of(context).size.width * 0.06,
                    ),
                  ],
                ),
                Text("City Name",
                    style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontsSize.f12,
                        color: FontsColor.grey700)),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: FontsColor.purple,
            size: MediaQuery.of(context).size.width * 0.06,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
