import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:progress_alliance/Theme/bgColor.dart';

class BookView extends StatefulWidget {
  final String pdfPath;
  const BookView({super.key, required this.pdfPath});

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  late Future<File> _pdfFileFuture;

  @override
  void initState() {
    super.initState();
    _pdfFileFuture = _initializePdf();
  }

  Future<File> _initializePdf() async {
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/temp.pdf');

    final assetData = await rootBundle.load('assets/pdf/random.pdf');
    await file.writeAsBytes(assetData.buffer.asUint8List());

    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgColor.white,
      appBar: AppBar(
        backgroundColor: BgColor.white,
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
      body: FutureBuilder<File>(
        future: _pdfFileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final pdfControllerPinch = PdfControllerPinch(
                document: PdfDocument.openFile(snapshot.data!.path),
              );

              return PdfViewPinch(
                controller: pdfControllerPinch,
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading PDF'));
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
