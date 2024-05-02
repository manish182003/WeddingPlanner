import 'package:eternal_tie/User/Home/services/HomeServices.dart';

import 'package:flutter/material.dart';

class CustomAllVenue extends StatefulWidget {
  final String place;
  final String name;
  final String price;
  final String imagePath;
  VoidCallback callback;
  CustomAllVenue({
    Key? key,
    required this.place,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.callback,
  }) : super(key: key);

  @override
  State<CustomAllVenue> createState() => _CustomAllVenueState();
}

class _CustomAllVenueState extends State<CustomAllVenue> {
  HomeServices homeServices = HomeServices();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: widget.callback,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  onTap: widget.callback,
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.place,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 20,
                          ),
                          Text('4.9 (5)'),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Veg',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    widget.price,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.people_sharp,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '20 - 1500 pax',
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.food_bank_outlined,
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          'Banquet Halls, Lawns/Farmhouses',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          homeServices.launchMessage(
                            context,
                            '+919548950280',
                            'Hello, I am using the EternalTie app and I am interested in your venue. Could we discuss more details regarding bookings and availability? Thank you!',
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.68,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.red),
                          ),
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.message_rounded,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Message',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          homeServices.launchWhatsapp(
                            context,
                            '+919548950280',
                            'Hello, I am using the EternalTie app and I am interested in your venue. Could we discuss more details regarding bookings and availability? Thank you!',
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.green,
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.call,
                              color: Colors.green,
                              size: 32,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
