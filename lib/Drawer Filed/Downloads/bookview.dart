import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class BookView extends StatefulWidget {
  const BookView({super.key});

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  late PdfControllerPinch pdfControllerPinch;

  @override
  void initState() {
    super.initState();
    pdfControllerPinch = PdfControllerPinch(
        document: PdfDocument.openAsset("assets/pdf/random.pdf"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.of(context).size.width * 0.15,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            size: MediaQuery.of(context).size.width * 0.06,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: PdfViewPinch(
            controller: pdfControllerPinch,
          ))
        ],
      ),
    );
  }
}
