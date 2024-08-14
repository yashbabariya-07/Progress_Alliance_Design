import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class HomeBottom extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTapped;
  const HomeBottom({
    super.key,
    required this.selectedIndex,
    required this.onTabTapped,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.075,
      child: BottomNavigationBar(
        backgroundColor: BgColor.white,
        currentIndex: selectedIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: FontsColor.purple,
        unselectedItemColor: FontsColor.grey,
        selectedLabelStyle: TextStyle(
          fontSize: FontsSize.f11,
          fontFamily: FontsFamily.inter,
          fontWeight: FontsWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: FontsFamily.inter,
          fontSize: FontsSize.f11,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Icons/PAG.png",
              color: selectedIndex == 0 ? FontsColor.purple : FontsColor.grey,
              width: MediaQuery.of(context).size.width * 0.08,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.shoppingOutline,
              size: MediaQuery.of(context).size.width * 0.08,
            ),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.mapMarkerOutline,
              size: MediaQuery.of(context).size.width * 0.08,
            ),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.widgetsOutline,
              size: MediaQuery.of(context).size.width * 0.08,
            ),
            label: 'Directory',
          ),
        ],
      ),
    );
  }
}

class NavigationHandler {
  final BuildContext context;

  NavigationHandler(this.context);

  void handleNavigation(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, Routes.paBusinessRoute);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, Routes.googleMapRoute);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, Routes.memberRoute);
        break;
      default:
        break;
    }
  }
}
