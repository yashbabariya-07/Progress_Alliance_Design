import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progress_alliance/routes/route.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

class Download extends StatefulWidget {
  const Download({super.key});

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  final List<Volume> volumes = List.generate(
    5,
    (index) => Volume(
      title: 'VOL ${index + 1}',
      date: DateFormat('dd MMM yyyy')
          .format(DateTime.now().subtract(Duration(days: index * 30))),
      imagePath: null,
      pdfPath: 'assets/pdf/random.pdf',
    ),
  );

  Future<void> _pickbookImage(int index) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        volumes[index].imagePath = pickedFile.path;
      });
    }
  }

  Future<void> _sharePdf(String pdfPath) async {
    final directory = await getTemporaryDirectory();
    final fileName = pdfPath.split('/').last;
    final tempFile = File('${directory.path}/$fileName');

    final assetData = await rootBundle.load(pdfPath);
    await tempFile.writeAsBytes(assetData.buffer.asUint8List());

    await Share.shareXFiles([XFile(tempFile.path)], text: '');
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          forceMaterialTransparency: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              color: Colors.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Downloads",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16.sp,
              color: Color.fromARGB(255, 16, 2, 90),
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_rounded,
                size: MediaQuery.of(context).size.width * 0.06),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.045,
                width: MediaQuery.of(context).size.width * 0.28,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 16, 2, 90),
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    "MAGAZINE",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13.sp,
                        color: const Color.fromARGB(255, 16, 2, 90),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: volumes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: VolumeWidget(
                        volume: volumes[index],
                        onImagePick: () => _pickbookImage(index),
                        onShare: () => _sharePdf(volumes[index].pdfPath),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Volume {
  String title;
  String date;
  String? imagePath;
  String pdfPath;

  Volume({
    required this.title,
    required this.date,
    this.imagePath,
    required this.pdfPath,
  });
}

class VolumeWidget extends StatefulWidget {
  final Volume volume;
  final VoidCallback onImagePick;
  final VoidCallback onShare;

  const VolumeWidget({
    super.key,
    required this.volume,
    required this.onImagePick,
    required this.onShare,
  });

  @override
  State<VolumeWidget> createState() => _VolumeWidgetState();
}

class _VolumeWidgetState extends State<VolumeWidget> {
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
    return _isLoading
        ? Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 5),
              height: MediaQuery.of(context).size.height * 0.16,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.2, color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ))
        : Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              border: Border.all(width: 0.2, color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: widget.onImagePick,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: widget.volume.imagePath != null
                        ? Image.file(
                            File(widget.volume.imagePath!),
                            fit: BoxFit.cover,
                          )
                        : Center(
                            child: Icon(Icons.add,
                                size:
                                    MediaQuery.of(context).size.width * 0.08)),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.volume.title,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.volume.date,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    widget.onShare();
                                  },
                                  child: Icon(
                                    Icons.share,
                                    size: MediaQuery.of(context).size.width *
                                        0.06,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                Image.asset(
                                  "assets/downloads.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.06,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.009,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.pdfviewRoute,
                              arguments: widget.volume.pdfPath);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.035,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue[50],
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.blue,
                                  size:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                ),
                                Text(
                                  'View',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.blue,
                                      fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
