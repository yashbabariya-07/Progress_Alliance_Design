import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CommonButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: mediaQuery.size.height * 0.06,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: FontsColor.purple,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f15,
              color: FontsColor.white,
              fontWeight: FontsWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
