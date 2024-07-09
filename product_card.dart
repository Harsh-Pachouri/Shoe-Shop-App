import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(216, 240, 253, 1),
          gradient: LinearGradient(colors: [
            Colors.white,
            Color.fromRGBO(111, 178, 215, 1),
          ]),
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "₹$price",
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              Image(
                height: 175,
                image: AssetImage(image),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
