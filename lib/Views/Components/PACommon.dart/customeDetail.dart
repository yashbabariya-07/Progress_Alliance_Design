import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class CustomeDetail extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icons1;
  final String icontitle1;
  final VoidCallback onTap1;
  final IconData? icons2;
  final String icontitle2;
  final VoidCallback onTap2;
  final IconData? icons3;
  final String icontitle3;
  final VoidCallback onTap3;
  final Widget? image;

  const CustomeDetail(
      {super.key,
      required this.title,
      required this.subtitle,
      this.icons1,
      required this.icontitle1,
      required this.onTap1,
      this.icons2,
      required this.icontitle2,
      required this.onTap2,
      this.icons3,
      required this.icontitle3,
      required this.onTap3,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.15,
              color: FontsColor.grey300,
              child: Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Text(
                  "Cover Photo",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FontsFamily.inter,
                    fontSize: FontsSize.f15,
                    color: FontsColor.grey600,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -MediaQuery.of(context).size.width * 0.13,
              left: MediaQuery.of(context).size.width * 0.38,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.15,
                    backgroundColor: FontsColor.white,
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.146,
                      child: Icon(
                        Icons.person,
                        size: MediaQuery.of(context).size.width * 0.1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.062,
        ),
        Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f15,
                  fontWeight: FontsWeight.bold),
            ),
            Text(
              subtitle,
              style: TextStyle(
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f13,
                  color: FontsColor.grey),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.024,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onTap1,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: FontsColor.grey300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icons1,
                        size: MediaQuery.of(context).size.width * 0.06,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Text(
                        icontitle1,
                        style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f12,
                          color: FontsColor.black,
                          fontWeight: FontsWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: onTap2,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: FontsColor.grey300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icons2,
                        size: MediaQuery.of(context).size.width * 0.06,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Text(
                        icontitle2,
                        style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f12,
                          color: FontsColor.black,
                          fontWeight: FontsWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: onTap3,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: FontsColor.grey300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      image != null
                          ? image!
                          : Icon(
                              icons3,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Text(
                        icontitle3,
                        style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f12,
                          color: FontsColor.black,
                          fontWeight: FontsWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
