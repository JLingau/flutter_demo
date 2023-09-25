import 'package:flavor_bistro/components/onboarding/onboarding_card.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final pageController = PageController();
  int currentIndex = 0;
  int onboardingLength = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${currentIndex + 1} OF 3'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/register");
            },
            icon: const Icon(Icons.skip_next),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/products");
            },
            icon: const Icon(Icons.data_array),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) => {
                setState(() {
                  currentIndex = value;
                })
              },
              children: [
                ...pages.map((e) {
                  return OnboardingCard(
                    e["image"],
                    e["title"],
                    e["description"],
                  );
                })
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ...List.generate(onboardingLength, (index) {
                      return InkWell(
                        onTap: () => pageController.animateToPage(
                          index,
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds: 300),
                        ),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                            color: currentIndex == index
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey.shade300,
                          ),
                          height: 10,
                          width: currentIndex == index ? 60 : 10,
                          margin: const EdgeInsets.only(right: 10),
                        ),
                      );
                    })
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (currentIndex <= 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.of(context).pushReplacementNamed("/dashboard");
                    }
                  },
                  child: const Text("Next"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<Map> pages = [
  {
    "image": "assets/illustration_1.png",
    "title": "Hungry? We've Got You Covered",
    "description":
        "Introducing Flavor Bistro – Your personal food adventure companion. Whether you're craving pizza, sushi, or something sweet, we've got a restaurant for every palate. Join us now and savor the convenience of restaurant-quality food, whenever and wherever you want."
  },
  {
    "image": "assets/illustration_2.png",
    "title": "Elevate Your Dining Experience",
    "description":
        "Welcome to Flavor Bistro, where every meal is an experience worth savoring. Our app connects you with the finest restaurants in town, offering a curated menu of delectable dishes. Dive into a world of flavors, order with ease, and enjoy exclusive discounts. Let's embark on a culinary journey together!"
  },
  {
    "image": "assets/illustration_3.png",
    "title": "Step into a World of Flavor",
    "description":
        "Get ready to embark on a mouthwatering adventure with Flavor Bistro. We've curated the best restaurants in town, just for you. Explore, order, and enjoy delicious meals from your favorite eateries. Let's start your culinary journey now!"
  },
];
