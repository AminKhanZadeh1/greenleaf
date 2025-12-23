import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlantCard extends StatelessWidget {
  final String id;
  final String name;
  final String price;
  final String image;

  const PlantCard({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset('assets/icons/heart.svg'),
              ),
            ),
          ),
          Expanded(
            child: Center(child: Image.network(image, fit: BoxFit.contain)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price, style: const TextStyle(fontSize: 16)),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset("assets/icons/add.svg"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
