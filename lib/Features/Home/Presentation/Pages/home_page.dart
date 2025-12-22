import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome to\nGreenLeaf',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/heart.svg"),
                      SizedBox(width: 16),
                      SvgPicture.asset("assets/icons/cart.svg"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          icon: SvgPicture.asset('assets/icons/search.svg'),
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: SvgPicture.asset("assets/icons/settings.svg"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                  children: const [
                    PlantCard(
                      name: 'Succulent Plant',
                      price: '\$39.99',
                      image: 'assets/plant1.png',
                    ),
                    PlantCard(
                      name: 'Dragon Plant',
                      price: '\$29.99',
                      image: 'assets/plant2.png',
                    ),
                    PlantCard(
                      name: 'Ravenea Plant',
                      price: '\$25.99',
                      image: 'assets/plant3.png',
                    ),
                    PlantCard(
                      name: 'Potted Plant',
                      price: '\$19.99',
                      image: 'assets/plant4.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlantCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const PlantCard({
    super.key,
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
            child: Center(child: SvgPicture.asset(image, fit: BoxFit.contain)),
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
