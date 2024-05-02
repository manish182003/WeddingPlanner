import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:eternal_tie/User/Home/services/allVenueData.dart';
import 'package:eternal_tie/User/Home/widgets/CustomAllVenue.dart';
import 'package:eternal_tie/User/Home/widgets/Venues.dart';

class VenueDetails extends StatefulWidget {
  static const String routename = '/venuedetails';
  final String image;
  final String name;
  final String place;
  final String price;
  final String tag;
  final bool isfetch;
  const VenueDetails({
    Key? key,
    required this.image,
    required this.name,
    required this.place,
    required this.price,
    required this.tag,
    this.isfetch = false,
  }) : super(key: key);

  @override
  State<VenueDetails> createState() => _VenueDetailsState();
}

class _VenueDetailsState extends State<VenueDetails> {
  List<Map<String, dynamic>> filteredVenues = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    filteredVenues = venues;
  }

  @override
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
                    'Starting Price (Taxes Extra)',
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
                        'Starting Price',
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
                        'Veg Price(taxes extra)',
                      ),
                      Text('Rs 1500 onwards'),
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
                        'Non Veg Price(taxes extra)',
                      ),
                      Text('Rs 1800 onwards'),
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
                          CustomAllVenue(
                            place: venue['place'],
                            name: venue['title'],
                            price: venue['price'],
                            imagePath: venue['image'],
                            callback: () {
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
