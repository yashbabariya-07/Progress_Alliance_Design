import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/bgColor.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/customShimmer.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:progress_alliance/Views/Pages/PA_Business/TabBarData/business.dart';
import 'package:progress_alliance/Views/Pages/PA_Business/TabBarData/personal.dart';
import 'package:progress_alliance/Views/Components/PACommon.dart/customeDetail.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberDetail extends StatefulWidget {
  const MemberDetail({super.key});

  @override
  State<MemberDetail> createState() => _MemberDetailState();
}

class _MemberDetailState extends State<MemberDetail>
    with SingleTickerProviderStateMixin, LoadingStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: BgColor.white,
        appBar: AppBar(
          backgroundColor: BgColor.white,
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
            "Member Details",
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
                onPressed: () {},
                icon: Icon(
                  MdiIcons.accountPlusOutline,
                  color: FontsColor.purple,
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
                    icons3: MdiIcons.accountGroupOutline,
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
                    height: MediaQuery.of(context).size.height * 0.024,
                  ),
                  TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: FontsColor.purple,
                    labelStyle: TextStyle(
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f16,
                      color: FontsColor.purple,
                      fontWeight: FontsWeight.bold,
                    ),
                    tabs: const [
                      Tab(text: "Personal"),
                      Tab(text: "Business"),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: TabBarView(
                          controller: _tabController,
                          children: const [
                            PersonalTab(),
                            BusinessTab(),
                          ]),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
