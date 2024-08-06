import 'package:flutter/material.dart';

class SyntaxShimmer extends StatefulWidget {
  const SyntaxShimmer({super.key});

  @override
  State<SyntaxShimmer> createState() => _SyntaxShimmerState();
}

class _SyntaxShimmerState extends State<SyntaxShimmer> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
