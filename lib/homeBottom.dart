import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 16, 2, 90),
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
              MdiIcons.homeOutline,
              size: MediaQuery.of(context).size.width * 0.08,
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
