import 'package:eternal_tie/User/Home/screens/VenueDetails.dart';
import 'package:eternal_tie/User/Home/widgets/CustomAllVenue.dart';
import 'package:eternal_tie/User/Home/widgets/Venues.dart';
import 'package:eternal_tie/User/Home/widgets/customAllPhotographer.dart';
import 'package:eternal_tie/User/Home/widgets/photographers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoGraphDetails extends StatefulWidget {
  static const String routename = '/photo-graph';
  final String image;
  final String name;
  final String place;
  final String price;
  final String tag;
  final bool isfetch;
  const PhotoGraphDetails({
    Key? key,
    required this.image,
    required this.name,
    required this.place,
    required this.price,
    required this.tag,
    this.isfetch = false,
  }) : super(key: key);

  @override
  State<PhotoGraphDetails> createState() => _PhotoGraphDetailsState();
}

class _PhotoGraphDetailsState extends State<PhotoGraphDetails> {
  List<Map<String, dynamic>> filteredVenues = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    filteredVenues = photographer;
  }

  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text(
                'Venues in Lonavala',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              pinned: true,
              floating: true,
            ),
            SliverToBoxAdapter(
              child: Hero(
                tag: widget.tag,
                child: ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: widget.isfetch
                      ? Image.network(
                          widget.image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          widget.image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    widget.place,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.green,
                      ),
                      Text(
                        '5.0 Review Score',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const Text(
                    'Photo + Video',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    widget.isfetch
                        ? 'Rs ${widget.price} onwards'
                        : widget.price,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const Text(
                    'Pricing Info',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Photo + Video',
                      ),
                      Text(widget.isfetch
                          ? 'Rs ${widget.price} onwards'
                          : widget.price),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    '------------------------------------------------------------------------------------------',
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Photo Package',
                      ),
                      Text('Rs 19,999 onwards'),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    '------------------------------------------------------------------------------------------',
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cinematography',
                      ),
                      Text('Rs 15000 onwards'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Center(
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    height: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Browse similar vendors',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  var venue = filteredVenues[index];
                  return Visibility(
                    visible: venue['id'].toString() != widget.tag,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          CustomAllPhotographers(
                            place: venue['place'],
                            name: venue['text'],
                            price: venue['price'],
                            imagePath: venue['image'],
                            callback: () {
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
                          const Divider(
                            color: Colors.grey,
                            height: 30,
                          )
                        ],
                      ),
                    ),
                  );
                },
                childCount: venues.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
