import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:progress_alliance/Routes/route.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

import 'package:progress_alliance/Views/Animation/ShimmerLoader/customShimmer.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
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
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: FontsColor.white,
        appBar: AppBar(
          backgroundColor: FontsColor.white,
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          forceMaterialTransparency: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
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
                                  radius:
                                      MediaQuery.of(context).size.width * 0.146,
                                  child: Icon(
                                    Icons.person,
                                    size:
                                        MediaQuery.of(context).size.width * 0.1,
                                  )),
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
                        "Company/Brand name",
                        style: TextStyle(
                            fontFamily: FontsFamily.inter,
                            fontSize: FontsSize.f15,
                            fontWeight: FontsWeight.bold),
                      ),
                      Text(
                        "Services Type",
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
                          onTap: () async {
                            const phoneNumber = 'tel:7874118535';
                            if (await canLaunch(phoneNumber)) {
                              await launch(phoneNumber);
                            } else {
                              throw 'Could not launch $phoneNumber';
                            }
                          },
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
                                  MdiIcons.phoneOutline,
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                ),
                                Text(
                                  'Call',
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
                          onTap: () {
                            launch('https://wa.me/7874118535');
                          },
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
                                  MdiIcons.whatsapp,
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                ),
                                Text(
                                  'Whatsapp',
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
                          onTap: () {},
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.28,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: FontsColor.grey300),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/Icons/save.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                ),
                                Text(
                                  'Save',
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Color.fromARGB(255, 16, 2, 90),
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
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        MdiIcons.accountOutline,
                                        color: FontsColor.grey500,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Contact Person',
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f13,
                                                color: FontsColor.grey),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.835,
                                            child: ListTile(
                                                leading: CircleAvatar(
                                                  radius: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.05,
                                                  child: Icon(
                                                    Icons.person,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.06,
                                                  ),
                                                ),
                                                title: Text(
                                                  'Person Name',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          FontsFamily.inter,
                                                      fontSize: FontsSize.f13,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                  'Person PA Details',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          FontsFamily.inter,
                                                      fontSize: FontsSize.f13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: FontsColor.grey),
                                                ),
                                                trailing: IconButton(
                                                  icon: Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.05,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context,
                                                        Routes
                                                            .memberDetailRoute);
                                                  },
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.012,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        MdiIcons.viewAgendaOutline,
                                        color: FontsColor.grey500,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Category',
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f13,
                                                color: FontsColor.grey),
                                          ),
                                          Text(
                                            'Company Category',
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f13,
                                                fontWeight: FontsWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        MdiIcons.viewAgendaOutline,
                                        color: FontsColor.grey500,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Sub Category',
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f13,
                                                color: FontsColor.grey),
                                          ),
                                          Text(
                                            'Company Sub Category',
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f13,
                                                fontWeight: FontsWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        MdiIcons.hexagonOutline,
                                        color: FontsColor.grey500,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Formation',
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f13,
                                                color: FontsColor.grey),
                                          ),
                                          Text(
                                            'Company Formation',
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f13,
                                                fontWeight: FontsWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        MdiIcons.shoppingOutline,
                                        color: FontsColor.grey500,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Product & Services',
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f13,
                                                color: FontsColor.grey),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005,
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: FontsColor.grey300),
                                            child: Center(
                                              child: Text('Company Product',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        FontsFamily.inter,
                                                    fontSize: FontsSize.f13,
                                                    fontWeight:
                                                        FontsWeight.bold,
                                                  )),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        MdiIcons.informationOutline,
                                        color: FontsColor.grey500,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'About Us',
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f13,
                                                color: FontsColor.grey),
                                          ),
                                          Text(
                                            'Company Intro...',
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f13,
                                                fontWeight: FontsWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        MdiIcons.emailOutline,
                                        color: FontsColor.grey500,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Email Address',
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f13,
                                                color: FontsColor.grey),
                                          ),
                                          Text(
                                            'Company e-mail address',
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f13,
                                                fontWeight: FontsWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        MdiIcons.web,
                                        color: FontsColor.grey500,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Website',
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f13,
                                                color: FontsColor.grey),
                                          ),
                                          Text(
                                            'Company website',
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f13,
                                                fontWeight: FontsWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        MdiIcons.mapMarkerOutline,
                                        color: FontsColor.grey500,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Address',
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f13,
                                                color: FontsColor.grey),
                                          ),
                                          Text(
                                            'Company address',
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f13,
                                                fontWeight: FontsWeight.bold),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.006,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              launch('https://maps.google.com');
                                            },
                                            child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.33,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: FontsColor.grey300),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Get Direction',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              FontsFamily.inter,
                                                          color:
                                                              FontsColor.blue,
                                                          fontSize:
                                                              FontsSize.f13),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.01,
                                                    ),
                                                    Image.asset(
                                                      "assets/Icons/sendd.png",
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.04,
                                                      color: FontsColor.blue,
                                                    )
                                                  ],
                                                )),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        MdiIcons.link,
                                        color: FontsColor.grey500,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Social Media Link',
                                            style: TextStyle(
                                                fontFamily: FontsFamily.inter,
                                                fontSize: FontsSize.f13,
                                                color: FontsColor.grey),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                launch(
                                                    'https://wa.me/7874118535');
                                              },
                                              child: Image.asset(
                                                "assets/Icons/wp.png",
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.08,
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
