import 'package:flutter/material.dart';

import 'package:progress_alliance/Theme/textStyle.dart';

class CountryCode {
  CountryCode._();

  static void showCountryCode({
    required BuildContext context,
    required TextEditingController searchController,
    required ValueNotifier<String> searchQuery,
    required Function(String, String) onCountrySelected,
  }) {
    final List<Map<String, String>> countries = [
      {'name': 'Canada', 'code': '+1', 'flag': '🇨🇦'},
      {'name': 'United States', 'code': '+1', 'flag': '🇺🇸'},
      {'name': 'India', 'code': '+91', 'flag': '🇮🇳'},
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: FontsColor.white,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: MediaQuery.of(context).size.width * 0.06,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.22,
                      ),
                      Text(
                        'Select a Country',
                        style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontsSize.f16,
                          fontWeight: FontsWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Divider(
                    thickness: 0.2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: FontsColor.grey, width: 0.2),
                    ),
                    child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search by country name, code and short...',
                        hintStyle: TextStyle(
                          fontSize: FontsSize.f14,
                          fontFamily: FontsFamily.inter,
                          color: FontsColor.grey700,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(10),
                        prefixIcon: Icon(
                          Icons.search,
                          size: MediaQuery.of(context).size.width * 0.06,
                          color: FontsColor.orange,
                        ),
                      ),
                      onChanged: (value) {
                        searchQuery.value = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Expanded(
                    child: ValueListenableBuilder<String>(
                      valueListenable: searchQuery,
                      builder: (context, value, child) {
                        final filteredCountries = countries.where((country) {
                          final countryName = country['name']!.toLowerCase();
                          final countryCode = country['code']!.toLowerCase();
                          final searchValue = value.toLowerCase();
                          return countryName.contains(searchValue) ||
                              countryCode.contains(searchValue);
                        }).toList();
                        return ListView.builder(
                          itemCount: filteredCountries.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text(
                                filteredCountries[index]['flag']!,
                                style: TextStyle(
                                  fontSize: FontsSize.f24,
                                  fontFamily: FontsFamily.inter,
                                ),
                              ),
                              title: Text(
                                filteredCountries[index]['name']!,
                                style: TextStyle(
                                  fontSize: FontsSize.f14,
                                  fontFamily: FontsFamily.inter,
                                  fontWeight: FontsWeight.bold,
                                ),
                              ),
                              trailing: Text(
                                filteredCountries[index]['code']!,
                                style: TextStyle(
                                  fontSize: FontsSize.f14,
                                  fontFamily: FontsFamily.inter,
                                ),
                              ),
                              onTap: () {
                                onCountrySelected(
                                  filteredCountries[index]['code']!,
                                  filteredCountries[index]['flag']!,
                                );
                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
