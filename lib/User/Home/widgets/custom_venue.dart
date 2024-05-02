import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomVenue extends StatelessWidget {
  final String image;
  final String name;
  final String place;
  final String price;
  final String id;
  final VoidCallback onClick;
  final bool isfetch;
  const CustomVenue({
    Key? key,
    required this.image,
    required this.name,
    required this.place,
    required this.price,
    required this.id,
    required this.onClick,
    this.isfetch = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onClick,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                // height: 200,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: onClick,
                    child: isfetch
                        ? Image(
                            image: NetworkImage(image),
                            fit: BoxFit.cover,
                          )
                        : Image(
                            image: AssetImage(image),
                            // height: 100,
                            // width: 200,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: const TextStyle(
                fontFamily: 'Arial',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              place,
              style: const TextStyle(
                fontFamily: 'Arial',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              isfetch ? 'Rs $price onwards' : price,
              style: const TextStyle(
                fontFamily: 'Arial',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
