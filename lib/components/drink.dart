import 'package:flutter/material.dart';

class Drink extends StatelessWidget {
  final String image;
  final String name;
  final String title;

  const Drink({
    super.key,
    required this.image,
    required this.name,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                vertical: 70,
                horizontal: 3,
              ),
              child: Row(),
            ),
          ),
        ),
        Positioned(
          top: -10,
          left: 20,
          bottom: 49,
          child: Image.asset(image, fit: BoxFit.contain),
        ),
        Positioned(
          top: 70,
          bottom: 0,
          right: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              Text(title, style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
        Positioned(
          top: 70,
          bottom: 0,
          right: 40,
          child: CircleAvatar(child: Icon(Icons.arrow_forward_sharp)),
        ),
      ],
    );
  }
}
