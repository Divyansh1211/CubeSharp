import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'category_list.dart';

class CatalogueScreen extends StatelessWidget {
  final List<String> bannerImages = [
    'images/builder.png',
  ];
  final List<String> topPicks = [
    'images/tool_kit.png',
    'images/large.png',
    
  ];
  final List<CategoryItem> categoryItems = [
    CategoryItem('images/tool_kit.png', 'Power Kit Tools'),
    CategoryItem('images/large.png', 'Timing Pully'),
    CategoryItem('images/nuts.png', 'Nut Bolt'),
    CategoryItem('images/timing_belt.png', 'Hammer'),
  ];
  static const String id = 'catalogue_screen';
  CatalogueScreen({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: 20), // Add left padding
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
              height: 200, // Adjust the height of the top picks list
              child: ListView.builder(
                itemCount: topPicks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            topPicks[index],
                            width: 120,
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                    
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
