import 'package:eternal_tie/Home/screens/SearchScreen.dart';
import 'package:eternal_tie/Home/widgets/CustomAllVenue.dart';
import 'package:eternal_tie/Home/widgets/Venues.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AllVenuesScreen extends StatefulWidget {
  static const String routename = '/allVenue';
  const AllVenuesScreen({super.key});

  @override
  State<AllVenuesScreen> createState() => _AllVenuesScreenState();
}

class _AllVenuesScreenState extends State<AllVenuesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Cities . Venues',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            TextFormField(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  SearchScreen.routename,
                );
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: const EdgeInsets.all(14),
                filled: true,
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search Wedding Venues',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: venues.length,
                itemExtent: 450,
                itemBuilder: (context, index) {
                  var venue = venues[index];
                  return Column(
                    children: [
                      CustomAllVenue(
                        place: venue['place'],
                        name: venue['title'],
                        price: venue['price'],
                        imagePath: venue['image'],
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 30,
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
