import 'package:eternal_tie/User/Home/screens/SearchScreen.dart';
import 'package:eternal_tie/User/Home/widgets/customAllPhotographer.dart';
import 'package:eternal_tie/User/Home/widgets/photographers.dart';
import 'package:flutter/material.dart';

class AllPhotographers extends StatefulWidget {
  static const String routename = '/all-photographer';
  const AllPhotographers({super.key});

  @override
  State<AllPhotographers> createState() => _AllPhotographersState();
}

class _AllPhotographersState extends State<AllPhotographers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Cities . Photographers',
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
                  arguments: {
                    'term': false,
                  },
                );
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: const EdgeInsets.all(14),
                filled: true,
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search Wedding Photographers',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: photographer.length,
                itemExtent: 450,
                itemBuilder: (context, index) {
                  var photo = photographer[index];
                  return Column(
                    children: [
                      CustomAllPhotographers(
                        place: photo['place'],
                        name: photo['text'],
                        price: photo['price'],
                        imagePath: photo['image'],
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
