import 'package:flutter/material.dart';

class CustomStory extends StatelessWidget {
  final String image;
  final Text text;
  const CustomStory({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(image),
        ),
        const SizedBox(
          height: 5,
        ),
        text,
      ],
    );
  }
}
