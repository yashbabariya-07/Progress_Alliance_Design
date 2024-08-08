import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:share_plus/share_plus.dart';

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

  void _sharePdf(File pdfFile) {
    Share.shareXFiles([XFile(pdfFile.path)], text: '');
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
        actions: [
          FutureBuilder<File>(
            future: _pdfFileFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () => _sharePdf(snapshot.data!),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error loading PDF'));
                }
              }
              return CircularProgressIndicator();
            },
          ),
        ],
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