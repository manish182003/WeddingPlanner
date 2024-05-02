import 'package:eternal_tie/User/Home/Models/Venue.dart';
import 'package:eternal_tie/User/Home/screens/VenueDetails.dart';
import 'package:eternal_tie/User/Home/services/HomeServices.dart';
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
  List<Venue> venue = [];
  List<Venue> searchVenue = [];
  HomeServices homeServices = HomeServices();
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVenues();
  }

  getVenues() async {
    venue = await homeServices.getAllVenues(context);
  }

  void onSearchResult(String title) {
    searchResult.clear();
    searchVenue.clear();
    if (widget.isVenue) {
      for (int i = 0; i < venues.length; i++) {
        if (venues[i]['title']
            .toString()
            .toLowerCase()
            .contains(title.toLowerCase())) {
          searchResult.add(venues[i]);
        }
        setState(() {});

        if (venue.isNotEmpty) {
          for (int i = 0; i < venue.length; i++) {
            if (venue[i]
                .vendorName
                .toLowerCase()
                .contains(title.toLowerCase())) {
              searchVenue.add(venue[i]);
            }
          }
          setState(() {});
        }
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
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchResult.length,
                      itemBuilder: (context, index) {
                        var search = searchResult[index];
                        return CustomSearch(
                          image: search['image'],
                          place: search['place'],
                          title:
                              widget.isVenue ? search['title'] : search['text'],
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
                    !widget.isVenue
                        ? Center()
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: searchVenue.length,
                            itemBuilder: (context, index) {
                              print(searchVenue.length);
                              var search = searchVenue[index];
                              return CustomSearch(
                                image: search.vendorImage,
                                place: 'Haldwani',
                                title: search.vendorName,
                                isfetch: true,
                                voidCallback: () {
                                  if (widget.isVenue) {
                                    Navigator.pushNamed(
                                      context,
                                      VenueDetails.routename,
                                      arguments: AllVenueData(
                                        image: search.vendorImage,
                                        name: search.vendorName,
                                        place: 'Haldwani',
                                        price: search.vendorPrice,
                                        tag: search.id,
                                        isfetch: true,
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          ),
                  ],
                ),
              ),
            )
          : const Center(
              child: Text('Nothing to show'),
            ),
    );
  }
}
