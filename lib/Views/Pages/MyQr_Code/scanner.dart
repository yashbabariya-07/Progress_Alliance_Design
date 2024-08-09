import 'package:flutter/material.dart';

import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isFlashOn = false;

  @override
  void reassemble() {
    super.reassemble();
    controller?.pauseCamera();
    controller?.resumeCamera();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      if (result != null) {
        _showDialog(context, result!.code);
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _showDialog(BuildContext context, String? data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Scanned QR Code"),
          content: Text("Data: $data"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          centerTitle: true,
          title: Text(
            "Mobile Scanner",
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f16,
              color: Color.fromARGB(255, 16, 2, 90),
              fontWeight: FontsWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.cancel,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await controller?.toggleFlash();
                bool? currentFlashState = await controller?.getFlashStatus();
                setState(() {
                  isFlashOn = currentFlashState ?? false;
                });
              },
              icon: Icon(
                isFlashOn ? Icons.flash_on : Icons.flash_off,
                size: MediaQuery.of(context).size.width * 0.06,
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: FontsColor.white,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/Logo/WPA1.png",
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.65,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
