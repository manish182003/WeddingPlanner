import 'package:eternal_tie/Home/widgets/CustomSearch.dart';
import 'package:eternal_tie/Home/widgets/Venues.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatefulWidget {
  static const String routename = '/search';
  const SearchScreen({super.key});

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
    for (int i = 0; i < venues.length; i++) {
      if (venues[i]['title']
          .toString()
          .toLowerCase()
          .contains(title.toLowerCase())) {
        searchResult.add(venues[i]);
      }
      setState(() {});
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
            hintText: 'Search Wedding Venues',
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
                    title: search['title'],
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
