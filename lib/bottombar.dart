import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTapped;
  const CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onTabTapped,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.075,
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(255, 16, 2, 90),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 11.sp,
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
