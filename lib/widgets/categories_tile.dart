import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String image;
  final String title;
  const CategoryTile({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              image,
              width: 120,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              height: 70,
              width: 120,
              decoration: const BoxDecoration(
                color: Colors.black26,
              ),
              child: Center(
                  child: Text(
                title,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ))),
        ],
      ),
    );
  }
}
