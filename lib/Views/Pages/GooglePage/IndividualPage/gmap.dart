import 'dart:io';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class CustomeMapp extends StatefulWidget {
  final Function(GoogleMapController) onMapCreated;
  const CustomeMapp({super.key, required this.onMapCreated});

  @override
  State<CustomeMapp> createState() => _CustomeGoogleMapState();
}

class _CustomeGoogleMapState extends State<CustomeMapp> {
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  late GoogleMapController mapController;

  final List<LatLng> _markerPositions = [
    const LatLng(21.221518982753015, 72.86885646384987),
    const LatLng(24.59656677793974, 72.7063899608816),
    const LatLng(18.988889624961452, 73.27039419325274),
    const LatLng(37.77678674433221, -122.4827957211993),
  ];

  final List<Marker> _markers = [];
  File? _profile;

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      customMarker(context);
    });
  }

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  void customMarker(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final markerSize = screenSize.width * 0.05;

    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(markerSize, markerSize)),
      "assets/Icons/marker.png",
    ).then((icon) {
      setState(() {
        markerIcon = icon;
      });
      _initializeMarkers();
    });
  }

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
                  color: FontsColor.white,
                  border: Border.all(width: 0.2, color: FontsColor.grey),
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
                                  color: FontsColor.grey300,
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
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f20,
                                            color: FontsColor.grey600,
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
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                                child: Icon(Icons.fiber_manual_record,
                                    size: MediaQuery.of(context).size.width *
                                        0.03,
                                    color: FontsColor.blue),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.006),
                              Text(
                                "1.2 km",
                                style: TextStyle(
                                  fontFamily: FontsFamily.inter,
                                  fontSize: FontsSize.f10,
                                  color: FontsColor.blue,
                                ),
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
                                        fontFamily: FontsFamily.inter,
                                        fontSize: FontsSize.f12,
                                        color: FontsColor.black,
                                        fontWeight: FontsWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      MdiIcons.whatsapp,
                                      color: FontsColor.purple,
                                      size: MediaQuery.of(context).size.width *
                                          0.06,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Icon(
                                      MdiIcons.phoneOutline,
                                      color: FontsColor.purple,
                                      size: MediaQuery.of(context).size.width *
                                          0.06,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Image.asset(
                                      "assets/Icons/sendd.png",
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.004,
                            ),
                            Text("Trueline Solution PVT Limited",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: FontsFamily.inter,
                                    fontSize: FontsSize.f12,
                                    color: FontsColor.grey)),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            Text(
                                "123 Tech Street, Silicon Valley, near the pedar road varachaa surat gujarat",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: FontsFamily.inter,
                                    fontSize: FontsSize.f12,
                                    color: FontsColor.grey)),
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
    widget.onMapCreated(controller);
    _customInfoWindowController.googleMapController = controller;
  }

  void _onMarkerTapped(LatLng position) {
    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(position, 18),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
