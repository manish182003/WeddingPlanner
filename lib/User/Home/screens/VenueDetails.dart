import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VenueDetails extends StatefulWidget {
  static const String routename = '/venuedetails';
  final String image;
  final String name;
  final String place;
  final String price;
  final String tag;
  const VenueDetails({
    Key? key,
    required this.image,
    required this.name,
    required this.place,
    required this.price,
    required this.tag,
  }) : super(key: key);

  @override
  State<VenueDetails> createState() => _VenueDetailsState();
}

class _VenueDetailsState extends State<VenueDetails> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Venues in Lonavala',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: Column(
          children: [
            Hero(
              tag: widget.tag,
              child: Image.asset(
                widget.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
