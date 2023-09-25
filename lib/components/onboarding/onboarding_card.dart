import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OnboardingCard extends StatelessWidget {
  String image;
  String title;
  String description;

  OnboardingCard(this.image, this.title, this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(image, height: 400),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(description)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
