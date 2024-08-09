import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTapped;
  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTabTapped,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.075,
      child: BottomNavigationBar(
        backgroundColor: FontsColor.white,
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
            icon: Icon(
              MdiIcons.accountCircleOutline,
              size: MediaQuery.of(context).size.width * 0.09,
            ),
            label: 'Personal',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.shoppingOutline,
              size: MediaQuery.of(context).size.width * 0.09,
            ),
            label: 'Business',
          ),
        ],
      ),
    );
  }
}
