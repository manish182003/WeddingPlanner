import 'package:eternal_tie/Home/screens/all_Venue.dart';
import 'package:eternal_tie/Home/widgets/Venues.dart';
import 'package:eternal_tie/Home/widgets/custom_story.dart';
import 'package:eternal_tie/Home/widgets/custom_venue.dart';
import 'package:eternal_tie/Home/widgets/photographers.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
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
                          return Row(
                            children: [
                              CustomVenue(
                                image: venue['image'],
                                name: venue['title'],
                                place: venue['place'],
                                price: venue['price'],
                                onClick: () {},
                              ),
                            ],
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
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
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
                    return Row(
                      children: [
                        CustomVenue(
                          image: venue['image'],
                          name: venue['text'],
                          place: venue['place'],
                          price: venue['price'],
                          onClick: () {},
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
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
                    onPressed: () {},
                    child: const Text(
                      'View all photographers',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
