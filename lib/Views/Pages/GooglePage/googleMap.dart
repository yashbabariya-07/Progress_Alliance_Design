import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Animation/ShimmerLoader/syntax.dart';
import 'package:progress_alliance/Views/Pages/GooglePage/IndividualPage/filter.dart';
import 'package:progress_alliance/Views/Pages/GooglePage/IndividualPage/gmap.dart';
import 'package:progress_alliance/Views/Pages/GooglePage/IndividualPage/toggel.dart';
import 'package:progress_alliance/Views/Pages/GooglePage/IndividualPage/view.dart';
import 'package:progress_alliance/Views/Widgets/drawer.dart';
import 'package:progress_alliance/Views/Widgets/homeBottom.dart';
import 'package:progress_alliance/Routes/route.dart';

class Googlemap extends StatefulWidget {
  const Googlemap({super.key});

  @override
  State<Googlemap> createState() => _GooglemapState();
}

class _GooglemapState extends State<Googlemap>
    with SingleTickerProviderStateMixin, LoadingStateMixin {
  GoogleMapController? mapController;
  String _selectedDistance = "";
  int selectedIndex = 0;

  int _selectedIndex = 2;
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, Routes.paBusinessRoute);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, Routes.googleMapRoute);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, Routes.memberRoute);
        break;
      default:
        break;
    }
  }

  final List<String> _distanceOptions = [
    "within 1km",
    "within 2km",
    "within 3km",
    "within 4km",
    "within 5km",
    "within 10km"
  ];

  final List<LatLng> _markerPositions = [
    const LatLng(21.221518982753015, 72.86885646384987),
    const LatLng(24.59656677793974, 72.7063899608816),
    const LatLng(18.988889624961452, 73.27039419325274),
    const LatLng(37.77678674433221, -122.4827957211993),
  ];

  void _updateMapForDistance(String option) {
    if (mapController == null) return;
    double zoomLevel;
    switch (option) {
      case "within 1km":
        zoomLevel = 15.0;
        break;
      case "within 2km":
        zoomLevel = 14.0;
        break;
      case "within 3km":
        zoomLevel = 13.5;
        break;
      case "within 4km":
        zoomLevel = 13.0;
        break;
      case "within 5km":
        zoomLevel = 12.5;
        break;
      case "within 10km":
        zoomLevel = 11.0;
        break;
      default:
        zoomLevel = 10.0;
    }

    mapController!.animateCamera(
      CameraUpdate.newLatLngZoom(_markerPositions[2], zoomLevel),
    );
  }

  void _onDistanceSelected(String option) {
    setState(() {
      _selectedDistance = option;
    });
    _updateMapForDistance(option);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: FontsColor.grey100,
        drawer: const PADrawer(),
        appBar: AppBar(
          backgroundColor: FontsColor.white,
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: FontsColor.grey,
              height: 0.2,
            ),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Image.asset(
                "assets/Icons/dr.png",
                color: FontsColor.purple,
                width: MediaQuery.of(context).size.width * 0.07,
              ),
            ),
          ),
          titleSpacing: 0,
          title: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.searchPlaceRoute);
            },
            child: Row(
              children: [
                Icon(
                  MdiIcons.mapMarkerOutline,
                  color: FontsColor.orange,
                  size: MediaQuery.of(context).size.height * 0.04,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.008,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Area Name",
                          style: TextStyle(
                              fontFamily: FontsFamily.inter,
                              fontSize: FontsSize.f14,
                              fontWeight: FontsWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: FontsColor.purple,
                          size: MediaQuery.of(context).size.width * 0.06,
                        ),
                      ],
                    ),
                    Text("City Name",
                        style: TextStyle(
                            fontFamily: FontsFamily.inter,
                            fontSize: FontsSize.f12,
                            color: FontsColor.grey700)),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: FontsColor.purple,
                size: MediaQuery.of(context).size.width * 0.06,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 10, left: 10, top: 10, bottom: 3),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: FontsColor.white,
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState) {
                                  return FilterMap(
                                    onDistanceSelected: (String distance) {
                                      _onDistanceSelected(distance);
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.037,
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(
                            color: FontsColor.white,
                            border:
                                Border.all(width: 0.2, color: FontsColor.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Filter",
                                style: TextStyle(
                                    fontFamily: FontsFamily.inter,
                                    fontSize: FontsSize.f13,
                                    fontWeight: FontsWeight.bold),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Image.asset(
                                "assets/Icons/filter.png",
                                color: FontsColor.grey,
                                width: MediaQuery.of(context).size.width * 0.06,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.025,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.037,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _distanceOptions.length,
                            itemBuilder: (BuildContext context, int index) {
                              final option = _distanceOptions[index];
                              final isSelected = _selectedDistance == option;
                              return GestureDetector(
                                onTap: () {
                                  _onDistanceSelected(option);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? FontsColor.orange50
                                        : FontsColor.white,
                                    border: Border.all(
                                      width: isSelected ? 0.5 : 0.2,
                                      color: isSelected
                                          ? FontsColor.orange
                                          : FontsColor.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Center(
                                    child: Text(
                                      option,
                                      style: TextStyle(
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f13,
                                        fontWeight: FontsWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Layout View",
                              style: TextStyle(
                                fontFamily: FontsFamily.inter,
                                fontSize: FontsSize.f12,
                                color: FontsColor.black,
                                fontWeight: FontsWeight.bold,
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          if (selectedIndex == 0)
                            const ToggelName(title: 'Map'),
                          if (selectedIndex == 1)
                            const ToggelName(title: 'List'),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          color: FontsColor.white,
                          border: Border.all(color: FontsColor.transparent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ToggelButton(
                              isSelected: selectedIndex == 0,
                              onTap: () {
                                setState(() {
                                  selectedIndex = 0;
                                });
                              },
                              icon: MdiIcons.mapMarkerOutline,
                            ),
                            ToggelButton(
                              isSelected: selectedIndex == 1,
                              onTap: () {
                                setState(() {
                                  selectedIndex = 1;
                                });
                              },
                              icon: MdiIcons.viewAgendaOutline,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
              child: Stack(
                children: [
                  if (selectedIndex == 0)
                    CustomeMapp(
                      onMapCreated: (GoogleMapController controller) {
                        setState(() {
                          mapController = controller;
                        });
                      },
                    ),
                  if (selectedIndex == 1) const GoogleView(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: HomeBottom(
          selectedIndex: _selectedIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
    );
  }
}
