// import 'package:flutter/material.dart';

// class Responsive extends StatelessWidget {
//   final Widget mobile;
//   final Widget tablet;

//   const Responsive({
//     Key? key,
//     required this.mobile,
//     required this.tablet,
//   }) : super(key: key);

//   static bool isMobile(BuildContext context) =>
//       MediaQuery.of(context).size.shortestSide <= 480;

//   static bool isTablet(BuildContext context) =>
//       MediaQuery.of(context).size.shortestSide > 480 &&
//       MediaQuery.of(context).size.shortestSide <= 768;

//   @override
//   Widget build(BuildContext context) {
//     if (isMobile(context)) {
//       return mobile;
//     } else if (isTablet(context)) {
//       return tablet;
//     } else {
//       return tablet;
//     }
//   }
// }
