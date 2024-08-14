import 'package:flutter/material.dart';
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Components/userTextField.dart/customeTextFormField.dart';

class CitySheet extends StatefulWidget {
  const CitySheet({super.key});

  @override
  State<CitySheet> createState() => _CitySheetState();
}

class _CitySheetState extends State<CitySheet> {
  final TextEditingController _state = TextEditingController();
  final TextEditingController _stateSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> _states = ['Gujarat', 'Maharashtra', 'Universal'];
    List<String> _filteredStates = List.from(_states);
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.008),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select State',
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
          CustomeSearchField(
            hintText: 'Search State.....',
            controller: _stateSearchController,
            onChange: (value) {
              setState(() {
                _filteredStates = _states
                    .where((state) =>
                        state.toLowerCase().contains(value.toLowerCase()))
                    .toList();
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredStates.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    _filteredStates[index],
                    style: TextStyle(
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f14,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _state.text = _filteredStates[index];
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StateSheet extends StatefulWidget {
  const StateSheet({super.key});

  @override
  State<StateSheet> createState() => _StateSheetState();
}

class _StateSheetState extends State<StateSheet> {
  final TextEditingController _city = TextEditingController();
  final TextEditingController _citySearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> _citys = [
      'Ahemdabad',
      'Ankleshwar',
      'Bhavnagar',
      'Jetpur',
      'Navsari',
      'Rajkot',
      'Surat',
      'Vadodara',
      'Vapi',
    ];
    List<String> _filteredCities = List.from(_citys);
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
                'Select City',
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
          CustomeSearchField(
            hintText: 'Search City.....',
            controller: _citySearchController,
            onChange: (value) {
              setState(() {
                _filteredCities = _citys
                    .where((city) =>
                        city.toLowerCase().contains(value.toLowerCase()))
                    .toList();
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCities.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    _filteredCities[index],
                    style: TextStyle(
                      fontFamily: FontsFamily.inter,
                      fontSize: FontsSize.f14,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _city.text = _filteredCities[index];
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
