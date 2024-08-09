import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progress_alliance/Theme/textStyle.dart';
import 'package:progress_alliance/Views/Pages/SearchArea/location_listTile.dart';
import 'package:progress_alliance/Views/Pages/SearchArea/models/auto_prediction.dart';
import 'package:progress_alliance/Views/Pages/SearchArea/models/place_response.dart';

class SearchPlace extends StatefulWidget {
  const SearchPlace({super.key});

  @override
  State<SearchPlace> createState() => _SearchPlaceState();
}

class _SearchPlaceState extends State<SearchPlace> {
  TextEditingController _searchController = TextEditingController();

  List<AutocompletePrediction> placePredictions = [];

  void placeAutocomplete(String query) async {
    print('Searching for: $query');
    Uri uri = Uri.https(
        "maps.googleapis.com",
        "maps/api/place/autocomplete/json",
        {"input": query, "key": 'AIzaSyAfeoKNgV6l1f5AEaAPkmi9u3kwjzaQwLE'});
    String? response = await fetchUrl(uri);

    if (response != null) {
      print('Response received: $response');
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      setState(() {
        placePredictions = result.predictions ?? [];
        print('Updated predictions: ${placePredictions.length}');
      });
    } else {
      print('No response or error occurred.');
    }
  }

  Future<String?> fetchUrl(Uri uri, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Place"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search The Place Here..',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                placeAutocomplete(value);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.008,
            ),
            ElevatedButton(
                onPressed: () {
                  placeAutocomplete("Surat");
                },
                child: Text("Press me")),
            Divider(
              height: 4,
              thickness: 1,
              color: FontsColor.grey,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: placePredictions.length,
                itemBuilder: (context, index) {
                  final prediction = placePredictions[index];
                  return LocationListtile(
                    press: () {
                      print('Location selected: ${prediction.description}');
                    },
                    location: prediction.description ?? 'No description',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
