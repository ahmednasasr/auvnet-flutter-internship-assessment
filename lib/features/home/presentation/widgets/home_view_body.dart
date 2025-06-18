import 'package:auvnet_flutter_internship_assessment/features/home/presentation/widgets/resturant_item.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/widgets/service_item.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/widgets/shortcut_item.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/services/hive.dart';

class HomeViewBody extends StatefulWidget {
  static const routename = "home_view_body";
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    const HomePageContent(),
    Center(child: Text('Categories Page')),
    Center(child: Text('Deliver Page')),
    Center(child: Text('Cart Page')),
    Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.delivery_dining), label: 'Deliver'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: pages[_selectedIndex],
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController adController = PageController();
    final List<String> adImages = [
      "assets/images/photo_2023-09-03_13-36-55 1.png",
      "assets/images/photo_2023-09-03_13-36-55 1.png",
      "assets/images/photo_2023-09-03_13-36-55 1.png",
    ];
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8900FE), Color(0xFFFFDE59)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Delivering to',
                        style: TextStyle(color: Colors.black)),
                    SizedBox(height: 4),
                    Text('Al Satwa, 81A Street',
                        style: TextStyle(color: Colors.black)),
                    SizedBox(height: 8),
                    Text(
                      'Hi ${HiveService().userName ?? "Guest"}!',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/213123.png'),
                  radius: 30,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Services:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildServiceItem(
                        "assets/images/13 1.png", 'Food', 'Up to 50%', () {}),
                    buildServiceItem(
                        "assets/images/vector-a-set-of-medicine-and-prescription-removebg-preview-2048x1773 1.png",
                        'Health & wellness',
                        '20mins',
                        () {}),
                    buildServiceItem(
                        "assets/images/6.png", 'Groceries', '15 mins', () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Image.asset("assets/images/Security Vault.png"),
                  const SizedBox(width: 10),
                  const Expanded(
                      child: Text(
                          'Got a code! Add your code and save on your order')),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Shortcuts:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildShortcut(
                          'assets/images/Group 6.png', 'Past orders', () {}),
                      const SizedBox(width: 12),
                      buildShortcut(
                          "assets/images/Group 10.png", 'Super Saver', () {}),
                      const SizedBox(width: 12),
                      buildShortcut("assets/images/Security Vault.png",
                          'Must-tries', () {}),
                      const SizedBox(width: 12),
                      buildShortcut(
                          "assets/images/Group 6.png", 'Give Back', () {}),
                      const SizedBox(width: 12),
                      buildShortcut(
                          "assets/images/Group 6.png", 'Best Sellers', () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 140,
                  child: PageView.builder(
                    controller: adController,
                    itemCount: adImages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            adImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                SmoothPageIndicator(
                  controller: adController,
                  count: adImages.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey.shade300,
                    activeDotColor: Colors.purple,
                    dotHeight: 8,
                    dotWidth: 8,
                    expansionFactor: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Text(
              'Popular restaurants nearby',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                buildRestaurantItem("assets/images/Group 13.png", 'Allo Beirut',
                    '32 mins', () {}),
                buildRestaurantItem(
                    "assets/images/Group 14.png", 'Laffah', '39 mins', () {}),
                buildRestaurantItem("assets/images/Group 16.png",
                    'Falafil Al Rabiah Al Khadra', '42 mins', () {}),
                buildRestaurantItem(
                    "assets/images/Group 17.png", 'Barbar', '34 mins', () {}),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
