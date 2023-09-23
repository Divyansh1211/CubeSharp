import 'package:carousel_slider/carousel_slider.dart';
import 'package:cubesharp_assignment/top_picks.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'category_list.dart';

class CatalogueScreen extends StatefulWidget {
  static const String id = 'catalogue_screen';
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int _selectedIndex = 0;

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<String> bannerImages = [
    'images/builder.png',
  ];

  final List<TopPicks> topPicks = [
    TopPicks(imagePath: 'images/drill_machine.png', text: 'Drill Machine'),
    TopPicks(
        imagePath: 'images/drill-machine-tool-kit.jpg',
        text: 'Drill Machine Tool Kit'),
    TopPicks(imagePath: 'images/plier.png', text: 'Plier'),
    TopPicks(imagePath: 'images/tool_kit.png', text: 'Power Kit Tools')
  ];

  final List<CategoryItem> categoryItems = [
    CategoryItem('images/tool_kit.png', 'Power Kit Tools'),
    CategoryItem('images/large.png', 'Timing Pully'),
    CategoryItem('images/nuts.png', 'Nut Bolt'),
    CategoryItem('images/timing_belt.png', 'Hammer'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'purva',
            style: GoogleFonts.petitFormalScript(
              textStyle: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.orange,
              size: 34,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: bannerImages.map((imageUrl) {
                return Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                );
              }).toList(),
              options: CarouselOptions(
                height: 160,
                autoPlay: false,
                enlargeCenterPage: true,
              ),
            ),
            SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset(
                            categoryItems[index].imagePath,
                            width: 120,
                            height: 80,
                          ),
                          SizedBox(height: 8),
                          Text(
                            categoryItems[index].name,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Top Picks',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount:
                    (topPicks.length / 2).ceil(),
                itemBuilder: (BuildContext context, int index) {
                  final leftIndex = index * 2;
                  final rightIndex = leftIndex + 1;

                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Card(
                            color: Colors.white,
                            elevation: 3,
                            child: SizedBox(
                              height: 150,
                              width: 200,
                              child: Column(
                                children: [
                                  Image.asset(
                                    topPicks[leftIndex].imagePath!,
                                    height: 100,
                                  ),
                                  SizedBox(height: 8),
                                  Text(topPicks[leftIndex].text!),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (rightIndex < topPicks.length)
                          Flexible(
                            child: Card(
                              color: Colors.white,
                              elevation: 3,
                              child: SizedBox(
                                height: 150,
                                width: 200,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      topPicks[rightIndex].imagePath!,
                                      height: 100,
                                    ),
                                    SizedBox(height: 8),
                                    Text(topPicks[rightIndex].text!),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        unselectedItemColor: Colors.grey,
        fixedColor: Colors.orange,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                  ),
                  radius: 30,
                  backgroundColor: Colors.orange,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onNavBarItemTapped,
      ),
    );
  }
}
