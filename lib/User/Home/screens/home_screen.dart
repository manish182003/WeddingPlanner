import 'dart:collection';

import 'package:eternal_tie/User/Home/Models/Venue.dart';
import 'package:eternal_tie/User/Home/screens/Shimmer.dart';
import 'package:eternal_tie/User/Home/screens/VenueDetails.dart';
import 'package:eternal_tie/User/Home/screens/all_Photographer.dart';
import 'package:eternal_tie/User/Home/screens/all_Venue.dart';
import 'package:eternal_tie/User/Home/screens/photographerDetails.dart';
import 'package:eternal_tie/User/Home/services/HomeServices.dart';
import 'package:eternal_tie/User/Home/services/allVenueData.dart';
import 'package:eternal_tie/User/Home/widgets/Venues.dart';
import 'package:eternal_tie/User/Home/widgets/custom_story.dart';
import 'package:eternal_tie/User/Home/widgets/custom_venue.dart';
import 'package:eternal_tie/User/Home/widgets/photographers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCity = 'All Cities'; // Default selected city
  int selectedIndex = 0;
  bool isLoading = true;
  List<Venue> venue = [];
  HomeServices homeServices = HomeServices();
  List<String> data = [
    'All Cities',
    'Haldwani',
    'Lucknow',
    'Delhi',
  ];

  List<Map<String, dynamic>> stories = [
    {'image': 'assets/images/story1.jpeg', 'text': 'Venues'},
    {'image': 'assets/images/story_2.jpeg', 'text': 'Photographers'},
    {'image': 'assets/images/story_3.jpeg', 'text': 'Weddings'},
    {'image': 'assets/images/story_4.jpeg', 'text': 'Catering'},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadData();
    getAllVenues();
  }

  getAllVenues() async {
    venue = await homeServices.getAllVenues(context);
  }

  LoadData() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton(
              value: selectedCity,
              iconEnabledColor: Colors.red,
              iconDisabledColor: Colors.red,
              style: const TextStyle(
                color: Colors.red,
                fontFamily: 'Arial',
                fontWeight: FontWeight.bold,
              ),
              underline: Container(
                color: Colors.transparent,
              ),
              onChanged: (data) {
                setState(() {
                  selectedCity = data!;
                });
              },
              items: data.map<DropdownMenuItem<String>>((String value1) {
                return DropdownMenuItem<String>(
                  value: value1,
                  child: Text(value1),
                );
              }).toList(),
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/images/profile.png',
                width: 50,
                height: 80,
              ),
            )
          ],
        ),
      ),
      body: isLoading
          ? const ShimmerLoader()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemExtent: 98,
                      itemCount: stories.length,
                      itemBuilder: (context, index) {
                        var story = stories[index];
                        return GestureDetector(
                          onTap: () {
                            if (story['text'] == 'Venues') {
                              Navigator.pushNamed(
                                context,
                                AllVenuesScreen.routename,
                              );
                            } else if (story['text'] == 'Photographers') {
                              Navigator.pushNamed(
                                context,
                                AllPhotographers.routename,
                              );
                            }
                          },
                          child: CustomStory(
                            image: story['image'],
                            text: Text(
                              story['text'],
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(
                            'Venue',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: SizedBox(
                            height: 300,
                            child: ScrollSnapList(
                              itemCount: 5,
                              itemSize: 300,

                              dynamicItemSize: true,

                              onItemFocus: (index) {},
                              // scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var venue = venues[index];
                                return Hero(
                                  tag: venue['id'].toString(),
                                  child: CustomVenue(
                                    image: venue['image'],
                                    name: venue['title'],
                                    place: venue['place'],
                                    price: venue['price'],
                                    id: venue['id'].toString(),
                                    onClick: () {
                                      Navigator.pushNamed(
                                        context,
                                        VenueDetails.routename,
                                        arguments: AllVenueData(
                                          image: venue['image'],
                                          name: venue['title'],
                                          place: venue['place'],
                                          price: venue['price'],
                                          tag: venue['id'].toString(),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AllVenuesScreen.routename,
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.orange,
                                )),
                            child: Center(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AllVenuesScreen.routename,
                                    );
                                  },
                                  child: const Text(
                                    'View all venues',
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  venue.isEmpty
                      ? const Center()
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Text(
                                  'Add On Venue',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: SizedBox(
                                  height: 300,
                                  child: ScrollSnapList(
                                    itemCount: venue.length,
                                    itemSize: 300,

                                    dynamicItemSize: true,

                                    onItemFocus: (index) {},
                                    // scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      var venues = venue[index];
                                      return Hero(
                                        tag: venues.id,
                                        child: CustomVenue(
                                          image: venues.vendorImage,
                                          name: venues.vendorName,
                                          place: 'Haldwani',
                                          price: venues.vendorPrice,
                                          id: venues.id,
                                          isfetch: true,
                                          onClick: () {
                                            Navigator.pushNamed(
                                              context,
                                              VenueDetails.routename,
                                              arguments: AllVenueData(
                                                image: venues.vendorImage,
                                                name: venues.vendorName,
                                                place: 'Haldwani',
                                                isfetch: true,
                                                price: venues.vendorPrice,
                                                tag: venues.id,
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AllVenuesScreen.routename,
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.orange,
                                      )),
                                  child: Center(
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            AllVenuesScreen.routename,
                                          );
                                        },
                                        child: const Text(
                                          'View All Venues',
                                          style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ).copyWith(top: venue.isNotEmpty ? 40 : 0),
                    child: const Text(
                      'Photographers for You',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: SizedBox(
                      height: 300,
                      child: ScrollSnapList(
                        itemCount: 5,
                        itemSize: 300,

                        dynamicItemSize: true,

                        onItemFocus: (index) {},
                        // scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var venue = photographer[index];
                          return Hero(
                            tag: venue['id'].toString(),
                            child: CustomVenue(
                              image: venue['image'],
                              name: venue['text'],
                              place: venue['place'],
                              price: venue['price'],
                              id: venue['id'].toString(),
                              onClick: () {
                                Navigator.pushNamed(
                                  context,
                                  PhotoGraphDetails.routename,
                                  arguments: {
                                    'name': venue['text'],
                                    'image': venue['image'],
                                    'place': venue['place'],
                                    'price': venue['price'],
                                    'id': venue['id'].toString(),
                                    'isfetch': false,
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AllPhotographers.routename,
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.orange,
                          )),
                      child: Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AllPhotographers.routename,
                              );
                            },
                            child: const Text(
                              'View all photographers',
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
    );
  }
}
