import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class CustomeField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData? icons;
  final VoidCallback onTap;
  final Widget? image;

  const CustomeField(
      {super.key,
      required this.label,
      required this.hintText,
      this.icons,
      required this.onTap,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f13,
                  fontWeight: FontsWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: FontsColor.grey200,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      image != null
                          ? image!
                          : Icon(
                              icons,
                              color: FontsColor.grey600,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.018,
                      ),
                      Text(
                        hintText,
                        style: TextStyle(
                            fontFamily: FontsFamily.inter,
                            color: FontsColor.grey,
                            fontSize: FontsSize.f13),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
