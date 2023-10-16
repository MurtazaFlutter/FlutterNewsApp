import 'package:flutter/material.dart';

class BreakingNewsSlider extends StatelessWidget {
  final String image;
  final String title;
  const BreakingNewsSlider(
      {super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              height: 250,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            height: 250,
            margin: const EdgeInsets.only(top: 150),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
              color: Colors.black26,
            ),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
