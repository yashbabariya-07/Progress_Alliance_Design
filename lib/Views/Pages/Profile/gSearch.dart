import 'package:flutter/material.dart';
import 'package:progress_alliance/Views/Components/AppBar/leadingTitleAppBar.dart';

class Google extends StatefulWidget {
  const Google({super.key});

  @override
  State<Google> createState() => _GoogleState();
}

class _GoogleState extends State<Google> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: LeadTitleAppBar(title: ''));
  }
}
