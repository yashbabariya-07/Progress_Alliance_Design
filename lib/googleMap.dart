import 'dart:io';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_alliance/homeBottom.dart';
import 'package:progress_alliance/routes/route.dart';

class Googlemap extends StatefulWidget {
  const Googlemap({super.key});

  @override
  State<Googlemap> createState() => _GooglemapState();
}

class _GooglemapState extends State<Googlemap>
    with SingleTickerProviderStateMixin {
  late GoogleMapController mapController;
  late TabController _tabController;
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
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

  final List<Map<String, String>> business = [
    {"title": "Advertising Services", "image": "assets/surat.jpg"},
    {"title": "Agriculture & Agro", "image": "assets/map.png"},
    {"title": "Automobile", "image": "assets/surat.jpg"},
    {"title": "Beauty Care & Cosmetic", "image": "assets/map.png"},
    {"title": "Chemicals", "image": "assets/surat.jpg"},
  ];

  final List<String> _distanceOptions = [
    "within 1km",
    "within 2km",
    "within 3km",
    "within 4km",
    "within 5km",
    "within 10km"
  ];
  String _selectedDistance = "";

  final List<LatLng> _markerPositions = [
    const LatLng(21.221518982753015, 72.86885646384987),
    const LatLng(24.59656677793974, 72.7063899608816),
    const LatLng(18.988889624961452, 73.27039419325274),
    const LatLng(37.77678674433221, -122.4827957211993),
  ];

  final List<Marker> _markers = [];
  File? _profile;

  final picker = ImagePicker();

  Future<File?> _pickProfile() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<void> _pickMapProfile() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profile = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    customMarker();
  }

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  void customMarker() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(20, 20)), "assets/marker.png")
        .then((icon) {
      setState(() {
        markerIcon = icon;
      });
      _initializeMarkers();
    });
  }

  void _filter(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel_rounded,
                          size: MediaQuery.of(context).size.width * 0.06,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.012,
                  ),
                  TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.orange,
                    labelStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: const [
                      Tab(text: "Business"),
                      Tab(text: "Distance"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 2 / 1,
                              ),
                              itemCount: business.length,
                              itemBuilder: (context, index) {
                                final item = business[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.2, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        flex: 4,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                          ),
                                          child: Image.asset(
                                            item["image"]!,
                                            fit: BoxFit.cover,
                                            height: double.infinity,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 6,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item["title"]!,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 12.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: _distanceOptions.length,
                          itemBuilder: (context, index) {
                            return RadioListTile<String>(
                              title: Text(
                                _distanceOptions[index],
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              value: _distanceOptions[index],
                              groupValue: _selectedDistance,
                              onChanged: (String? value) {
                                setState(() {
                                  _onDistanceSelected(value!);
                                  Navigator.pop(context);
                                });
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  List<Map<String, dynamic>> users = [
    {
      "name": "John Doe",
      "company": "Caliente iTech",
      "address":
          "235, Crystal plaza near devi darshan society punagam varachha surat",
      "distance": "0.045 km",
      "profileImage": null,
    },
    {
      "name": "Jane Smith",
      "company": "Tech Solutions",
      "address": "123 Tech Street, Silicon Valley",
      "distance": "1.2 km",
      "profileImage": null,
    },
    {
      "name": "Axar Patel",
      "company": "OTexh Solutions",
      "address":
          "123 Tech Street, Silicon Valley, near the pedar road varachaa surat gujarat",
      "distance": "2.96 km",
      "profileImage": null,
    },
  ];

  void _initializeMarkers() async {
    for (int i = 0; i < _markerPositions.length; i++) {
      final LatLng position = _markerPositions[i];

      final Marker marker = Marker(
        markerId: MarkerId('marker_$i'),
        position: position,
        icon: markerIcon,
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: _pickMapProfile,
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.18,
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300],
                                ),
                                child: _profile != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          _profile!,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Center(
                                        child: Text(
                                          "+",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 20.sp,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                                child: Icon(Icons.fiber_manual_record,
                                    size: MediaQuery.of(context).size.width *
                                        0.03,
                                    color: Colors.blue),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.006),
                              Text(
                                "1.2 km",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontFamily: 'Inter',
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "John Doe",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/wp.png",
                                      width: MediaQuery.of(context).size.width *
                                          0.08,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.008,
                                    ),
                                    Icon(
                                      Icons.call,
                                      size: MediaQuery.of(context).size.width *
                                          0.06,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.008,
                                    ),
                                    Icon(
                                      Icons.send,
                                      size: MediaQuery.of(context).size.width *
                                          0.06,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.004,
                            ),
                            Text(
                              "Trueline Solution PVT Limited",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12.sp,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            Text(
                              "123 Tech Street, Silicon Valley, near the pedar road varachaa surat gujarat",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12.sp,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              position);
        },
      );

      _markers.add(marker);
    }
    setState(() {});
  }

  Future<String> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      return "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
    } catch (e) {
      return "Address not available";
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _customInfoWindowController.googleMapController = controller;
  }

  void _onMarkerTapped(LatLng position) {
    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(position, 18),
    );
  }

  void _onDistanceSelected(String option) {
    setState(() {
      _selectedDistance = option;

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

      mapController.animateCamera(
        CameraUpdate.newLatLngZoom(_markerPositions[2], zoomLevel),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.64,
          child: Drawer(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Column(
                children: [
                  Image.asset(
                    "assets/PA.png",
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  const Divider(thickness: 0.5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.note_add_sharp,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            title: Text(
                              "Complaint",
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.ComplaintRoute);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.download,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            title: Text(
                              "Downloads",
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.downloadRoute);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.feedback,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            title: Text(
                              "Feedback & Review",
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.feedbackRoute);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.contact_phone,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            title: Text(
                              "Contact Us",
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, Routes.contactRoute);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.info,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            title: Text(
                              "About Us",
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.help,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            title: Text(
                              "Help?",
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.red[50],
                      ),
                      height: MediaQuery.of(context).size.width * 0.1,
                      width: MediaQuery.of(context).size.width * 0.32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/lt.png",
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.009),
                          Text(
                            "LOG OUT",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: MediaQuery.of(context).size.width * 0.15,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: Colors.grey,
              height: 0.2,
            ),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Image.asset(
                "assets/dr.png",
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
                  Icons.pin_drop,
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
                              fontFamily: 'Inter',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: MediaQuery.of(context).size.width * 0.06,
                        ),
                      ],
                    ),
                    Text(
                      "City Name",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12.sp,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
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
                          _filter(context);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.037,
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 0.2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Filter",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.008,
                              ),
                              Icon(
                                Icons.dock_sharp,
                                size: MediaQuery.of(context).size.width * 0.06,
                              ),
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
                                        ? Colors.orange[100]
                                        : Colors.white,
                                    border: Border.all(
                                      width: isSelected ? 0.5 : 0.2,
                                      color: isSelected
                                          ? Colors.orange
                                          : Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Center(
                                    child: Text(
                                      option,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        color: isSelected
                                            ? Colors.orange
                                            : Colors.black,
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
                          Text(
                            "Layout View",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          if (selectedIndex == 0)
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.023,
                              width: MediaQuery.of(context).size.width * 0.13,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 16, 2, 90),
                                border: Border.all(
                                    width: 1, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "Map",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          if (selectedIndex == 1)
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.023,
                              width: MediaQuery.of(context).size.width * 0.13,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 16, 2, 90),
                                border: Border.all(
                                    width: 1, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "List",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 0;
                                });
                              },
                              child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.033,
                                  width:
                                      MediaQuery.of(context).size.width * 0.087,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: selectedIndex == 0
                                        ? Colors.grey[300]
                                        : Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.pin_drop,
                                    size: MediaQuery.of(context).size.width *
                                        0.06,
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 1;
                                });
                              },
                              child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.033,
                                  width:
                                      MediaQuery.of(context).size.width * 0.087,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: selectedIndex == 1
                                        ? Colors.grey[300]
                                        : Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.list,
                                    size: MediaQuery.of(context).size.width *
                                        0.06,
                                  )),
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
                    Stack(
                      children: [
                        GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: _markerPositions[2],
                            zoom: 10,
                          ),
                          markers: Set<Marker>.of(_markers),
                          onTap: (LatLng position) {
                            _customInfoWindowController.hideInfoWindow!();
                          },
                          onCameraMove: (position) {
                            _customInfoWindowController.onCameraMove!();
                          },
                        ),
                        CustomInfoWindow(
                          controller: _customInfoWindowController,
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.width * 0.85,
                          offset: 50,
                        ),
                      ],
                    ),
                  if (selectedIndex == 1)
                    ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final profile = await _pickProfile();
                                          if (profile != null) {
                                            setState(() {
                                              users[index]['profileImage'] =
                                                  profile;
                                            });
                                          }
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey[200],
                                          ),
                                          child: user['profileImage'] != null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.file(
                                                    user['profileImage'],
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : Center(
                                                  child: Text(
                                                    "+",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontSize: 20.sp,
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.006,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                            child: const Icon(
                                                Icons.fiber_manual_record,
                                                size: 10,
                                                color: Colors.blue),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.006),
                                          Text(
                                            user['distance'],
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                user['name'],
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 12.sp,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/wp.png",
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.08,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.02,
                                                ),
                                                Icon(
                                                  Icons.call,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.06,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.02,
                                                ),
                                                Icon(
                                                  Icons.send,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.06,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Text(
                                          user['company'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        Text(
                                          user['address'],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 12.sp,
                                              color: Colors.grey[700]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
