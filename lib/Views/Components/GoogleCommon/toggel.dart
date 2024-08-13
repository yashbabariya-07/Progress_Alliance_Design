import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class ToggelName extends StatelessWidget {
  final String title;
  const ToggelName({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.023,
      width: MediaQuery.of(context).size.width * 0.13,
      decoration: BoxDecoration(
        color: FontsColor.purple,
        border: Border.all(width: 1, color: FontsColor.transparent),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(title,
            style: TextStyle(
                fontFamily: FontsFamily.inter,
                fontSize: FontsSize.f12,
                fontWeight: FontsWeight.bold,
                color: FontsColor.white)),
      ),
    );
  }
}

class ToggelButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const ToggelButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.033,
        width: MediaQuery.of(context).size.width * 0.087,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: isSelected ? FontsColor.grey300 : FontsColor.white,
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: FontsColor.grey500,
          size: MediaQuery.of(context).size.width * 0.06,
        ),
      ),
    );
  }
}
