import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/customShimmer.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:progress_alliance/Views/Components/PACommon.dart/TabBarData/about.dart';
import 'package:progress_alliance/Views/Components/PACommon.dart/TabBarData/contact.dart';
import 'package:progress_alliance/Views/Components/PACommon.dart/customeDetail.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class CompanyDetail extends StatefulWidget {
  const CompanyDetail({super.key});

  @override
  State<CompanyDetail> createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail>
    with SingleTickerProviderStateMixin, LoadingStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  Future<Uint8List> _loadAsset(String path) async {
    return await rootBundle
        .load(path)
        .then((data) => data.buffer.asUint8List());
  }

  Future<void> _generateAndSharePDF() async {
    final pdf = pw.Document();
    final imageData = await _loadAsset('assets/Icons/wp.png');
    final imageData1 = await _loadAsset('assets/Icons/call.png');
    final image = pw.MemoryImage(imageData);
    final image1 = pw.MemoryImage(imageData1);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Container(
                width: 70,
                height: 70,
                decoration: pw.BoxDecoration(
                  shape: pw.BoxShape.rectangle,
                  color: const PdfColor.fromInt(0xFFEEEEEE),
                  borderRadius: pw.BorderRadius.circular(5),
                ),
                child: pw.Center(child: pw.Text('Logo')),
              ),
              pw.SizedBox(height: 20),
              pw.Text('Company/Brand Name',
                  style: pw.TextStyle(
                      fontSize: FontsSize.f16, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text('Your Company Service/product',
                  style: const pw.TextStyle(
                    color: PdfColor.fromInt(0xFF9E9E9E),
                  )),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.UrlLink(
                    destination: 'tel:7874118535',
                    child: pw.Container(
                      width: 100,
                      height: 40,
                      decoration: pw.BoxDecoration(
                        color: const PdfColor.fromInt(0xFFEEEEEE),
                        borderRadius: pw.BorderRadius.circular(5),
                      ),
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Image(image1, height: 20, width: 20),
                            pw.SizedBox(width: 5),
                            pw.Center(child: pw.Text('Call'))
                          ]),
                    ),
                  ),
                  pw.SizedBox(width: 10),
                  pw.UrlLink(
                    destination: 'https://wa.me/7874118535',
                    child: pw.Container(
                      width: 100,
                      height: 40,
                      decoration: pw.BoxDecoration(
                        color: const PdfColor.fromInt(0xFFEEEEEE),
                        borderRadius: pw.BorderRadius.circular(5),
                      ),
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Image(image, height: 20, width: 20),
                            pw.SizedBox(width: 5),
                            pw.Center(child: pw.Text('WhatsApp'))
                          ]),
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Divider(
                thickness: 0.5,
                color: const PdfColor.fromInt(0xFFE0E0E0),
              ),
              pw.SizedBox(height: 10),
              pw.Text('Contact',
                  style: pw.TextStyle(
                      fontSize: FontsSize.f18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
                pw.Container(
                  width: 50,
                  height: 50,
                  decoration: pw.BoxDecoration(
                    shape: pw.BoxShape.circle,
                    color: const PdfColor.fromInt(0xFFEEEEEE),
                    borderRadius: pw.BorderRadius.circular(20),
                  ),
                  child: pw.Center(child: pw.Text('Image')),
                ),
                pw.SizedBox(width: 10),
                pw.Text('Contact Person Name',
                    style: pw.TextStyle(fontSize: FontsSize.f16)),
              ]),
              pw.SizedBox(height: 10),
              pw.Divider(
                thickness: 0.5,
                color: const PdfColor.fromInt(0xFFE0E0E0),
              ),
              pw.SizedBox(height: 10),
              pw.Text('Address',
                  style: pw.TextStyle(
                      fontSize: FontsSize.f18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text('Your Company address',
                  style: pw.TextStyle(fontSize: FontsSize.f16)),
              pw.SizedBox(height: 10),
              pw.Divider(
                thickness: 0.5,
                color: const PdfColor.fromInt(0xFFE0E0E0),
              ),
              pw.SizedBox(height: 10),
              pw.Text('Services & Products',
                  style: pw.TextStyle(
                      fontSize: FontsSize.f18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    'SERVICES',
                    'PRODUCTS',
                    'OTHER',
                  ]
                      .map((service) => pw.Container(
                            padding: const pw.EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: pw.BoxDecoration(
                              color: const PdfColor.fromInt(0xFFEEEEEE),
                              borderRadius: pw.BorderRadius.circular(15),
                            ),
                            child: pw.Text(service),
                          ))
                      .toList(),
                ),
              )
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/company_details.pdf');
    await file.writeAsBytes(await pdf.save());

    await Share.shareXFiles([XFile(file.path)], subject: 'Company Details');
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: FontsColor.white,
        appBar: AppBar(
          backgroundColor: FontsColor.white,
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          forceMaterialTransparency: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: FontsColor.grey,
              height: 0.2,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Company Details",
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f16,
              color: FontsColor.purple,
              fontWeight: FontsWeight.bold,
            ),
          ),
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
            IconButton(
                onPressed: _generateAndSharePDF,
                icon: Icon(
                  Icons.share,
                  color: FontsColor.grey500,
                  size: MediaQuery.of(context).size.width * 0.06,
                )),
          ],
        ),
        body: isLoading
            ? const ShimmerCustom()
            : Column(
                children: [
                  CustomeDetail(
                    title: 'Company/Brand Name',
                    subtitle: 'Services Type',
                    icons1: MdiIcons.phoneOutline,
                    icons2: MdiIcons.whatsapp,
                    image: Image.asset(
                      "assets/Icons/save.png",
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    icontitle1: 'Call',
                    icontitle2: 'Whatsapp',
                    icontitle3: '1-2-1',
                    onTap1: () async {
                      const phoneNumber = 'tel:7874118535';
                      if (await canLaunch(phoneNumber)) {
                        await launch(phoneNumber);
                      } else {
                        throw 'Could not launch $phoneNumber';
                      }
                    },
                    onTap2: () {
                      launch('https://wa.me/7874118535');
                    },
                    onTap3: () {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: const Color.fromARGB(255, 16, 2, 90),
                    labelStyle: TextStyle(
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f16,
                      color: FontsColor.purple,
                      fontWeight: FontsWeight.bold,
                    ),
                    tabs: const [
                      Tab(text: "About"),
                      Tab(text: "Contact"),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: TabBarView(
                        controller: _tabController,
                        children: const [AboutTab(), ContactTab()],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
