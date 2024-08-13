import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:progress_alliance/Theme/textStyle.dart';

class FilterMap extends StatefulWidget {
  const FilterMap({super.key});

  @override
  State<FilterMap> createState() => _FilterMapState();
}

class _FilterMapState extends State<FilterMap>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  GoogleMapController? mapController;
  String _selectedDistance = "";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  final List<LatLng> _markerPositions = [
    const LatLng(21.221518982753015, 72.86885646384987),
    const LatLng(24.59656677793974, 72.7063899608816),
    const LatLng(18.988889624961452, 73.27039419325274),
    const LatLng(37.77678674433221, -122.4827957211993),
  ];

  final List<Map<String, String>> business = [
    {"title": "Advertising Services", "image": "assets/Images/surat.jpg"},
    {"title": "Agriculture & Agro", "image": "assets/Images/map.png"},
    {"title": "Automobile", "image": "assets/Images/surat.jpg"},
    {"title": "Beauty Care & Cosmetic", "image": "assets/Images/map.png"},
    {"title": "Chemicals", "image": "assets/Images/surat.jpg"},
  ];

  final List<String> _distanceOptions = [
    "within 1km",
    "within 2km",
    "within 3km",
    "within 4km",
    "within 5km",
    "within 10km"
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
                  fontFamily: FontsFamily.inter,
                  fontSize: FontsSize.f16,
                  fontWeight: FontsWeight.bold,
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
            indicatorColor: FontsColor.orange,
            labelStyle: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontsSize.f16,
              color: FontsColor.black,
              fontWeight: FontsWeight.bold,
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
                            border:
                                Border.all(width: 0.2, color: FontsColor.grey),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item["title"]!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: FontsFamily.inter,
                                            fontSize: FontsSize.f12,
                                            color: FontsColor.black,
                                            fontWeight: FontsWeight.bold,
                                          )),
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
                            fontFamily: FontsFamily.inter,
                            fontSize: FontsSize.f14,
                            fontWeight: FontsWeight.bold),
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
  }
}
