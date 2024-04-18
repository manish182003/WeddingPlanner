import 'package:eternal_tie/User/Home/screens/VenueDetails.dart';
import 'package:eternal_tie/User/Home/services/allVenueData.dart';
import 'package:eternal_tie/User/Home/widgets/photographers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:eternal_tie/User/Home/widgets/CustomSearch.dart';
import 'package:eternal_tie/User/Home/widgets/Venues.dart';

class SearchScreen extends StatefulWidget {
  static const String routename = '/search';
  bool isVenue;
  SearchScreen({
    Key? key,
    required this.isVenue,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map<String, dynamic>> searchResult = [];
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void onSearchResult(String title) {
    searchResult.clear();

    if (widget.isVenue) {
      for (int i = 0; i < venues.length; i++) {
        if (venues[i]['title']
            .toString()
            .toLowerCase()
            .contains(title.toLowerCase())) {
          searchResult.add(venues[i]);
        }
        setState(() {});
      }
    } else {
      for (int i = 0; i < photographer.length; i++) {
        if (photographer[i]['text']
            .toString()
            .toLowerCase()
            .contains(title.toLowerCase())) {
          searchResult.add(photographer[i]);
        }
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextFormField(
          controller: searchController,
          onChanged: (value) {
            onSearchResult(value);
          },
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(14),
            filled: true,
            prefixIcon: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            hintText: widget.isVenue
                ? 'Search Wedding Venues'
                : 'Search Wedding Photographers',
          ),
        ),
      ),
      body: searchController.text.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (context, index) {
                  var search = searchResult[index];
                  return CustomSearch(
                    image: search['image'],
                    place: search['place'],
                    title: widget.isVenue ? search['title'] : search['text'],
                    voidCallback: () {
                      if (widget.isVenue) {
                        Navigator.pushNamed(
                          context,
                          VenueDetails.routename,
                          arguments: AllVenueData(
                            image: search['image'],
                            name: search['title'],
                            place: search['place'],
                            price: search['price'],
                            tag: search['id'].toString(),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            )
          : const Center(
              child: Text('Nothing to show'),
            ),
    );
  }
}
