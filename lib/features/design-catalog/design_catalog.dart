import 'package:flutter/material.dart';
import 'dart:async';

// Import your pages here
import 'building/building_desings.dart';
import 'exterior/exterior.dart';
import 'home_designs.dart';
import 'interior/interior_designs.dart';
import 'office/office_designs.dart';
import '../../navbar/bottom_nav_bar.dart';

class DesignCatalogPage extends StatefulWidget {
  const DesignCatalogPage({super.key});

  @override
  _DesignCatalogPageState createState() => _DesignCatalogPageState();
}

class _DesignCatalogPageState extends State<DesignCatalogPage> with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<double> _animation;
  Timer? _timer;
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  // List of images from all sections
  final List<Map<String, String>> allImagePaths = [
    // Images from different categories (e.g., Home, Offices, etc.)
    {'path': 'assets/feature-container/design-catalog.jpg', 'title': 'Design Catalog'},
    {'path': 'assets/RENOVATION/BEDROOMS/Bedroom before and After.jpg', 'title': 'Bedroom Renovation'},
    {'path': 'assets/RENOVATION/BEDROOMS/Master Bedroom Makeover.jpg', 'title': 'Master Bedroom Makeover'},
    {'path': 'assets/RENOVATION/outlooks/Modern Navy and Cedar Ranch Style Remodel.jpg', 'title': 'Navy and Cedar Remodel'},
    {'path': 'assets/RENOVATION/kitchen/Before and After.jpg', 'title': 'Kitchen Renovation'},
    {'path': 'assets/RENOVATION/outlooks/Before and After.jpg', 'title': 'Exterior Renovation'},

    // Newly added outlook images
    {'path': 'assets/RENOVATION/outlooks/1af7a1a3-05b5-40ef-aef2-866e27d376ca.jpg', 'title': 'Exterior Renovation 1'},
    {'path': 'assets/RENOVATION/outlooks/2de41b61-1748-4cc0-965a-495edfb0a35a.jpg', 'title': 'Exterior Renovation 2'},
    {'path': 'assets/RENOVATION/outlooks/4 Favorite Siding Colors by James Hardie _ Blog _ brick&batten.jpg', 'title': 'Siding Colors'},
    {'path': 'assets/RENOVATION/outlooks/5 GREAT WAYS TO TRANSFORM YOUR EXTERIOR ON A BUDGET — THREE BIRDS RENOVATIONS.jpg', 'title': 'Budget-Friendly Exterior Transformation'},
    {'path': 'assets/RENOVATION/outlooks/6bc4342b-41f8-4dcd-b07d-70e9a36188a7.jpg', 'title': 'Modern Exterior Update'},
    {'path': 'assets/RENOVATION/outlooks/7bd55559-d4aa-41e8-a20b-0bb913492d68.jpg', 'title': 'Traditional Exterior Renovation'},
    {'path': 'assets/RENOVATION/outlooks/8 Modern Cape Cod House Updates _ brick&batten.jpg', 'title': 'Cape Cod House Update'},
    {'path': 'assets/RENOVATION/outlooks/10a43618-cdee-4457-9487-90e7a1646bba.jpg', 'title': 'Contemporary House Design'},
    {'path': 'assets/RENOVATION/outlooks/12 Amazingly Wonderful Exterior Home Makeovers.jpg', 'title': 'Amazing Home Makeover'},
    {'path': 'assets/RENOVATION/outlooks/12 Best Exterior Window Shutter Colors _ brick&batten.jpg', 'title': 'Window Shutter Colors'},
    {'path': 'assets/RENOVATION/outlooks/12 Front Porch Addition Ideas _ brick&batten.jpg', 'title': 'Front Porch Addition Ideas'},
    {'path': 'assets/RENOVATION/outlooks/12 Garage Door Makeovers _ Garage Door Ideas & Photos.jpg', 'title': 'Garage Door Makeover'},
    {'path': 'assets/RENOVATION/outlooks/15 Contemporary House Designs with Before & Afters _ brick&batten.jpg', 'title': 'Contemporary House Designs'},
    {'path': 'assets/RENOVATION/outlooks/18 Front Door Ideas That Will Make Your Home Stand Out in 2021.jpg', 'title': 'Front Door Ideas'},
    {'path': 'assets/RENOVATION/outlooks/18 Predictions for 2020 Exterior Home Design _ Blog _ brick&batten.jpg', 'title': 'Exterior Design Predictions'},
    {'path': 'assets/RENOVATION/outlooks/20 Home Exterior Makeover Before and After Ideas _ Home Stories A to Z.jpg', 'title': 'Home Exterior Makeover Ideas'},
    {'path': 'assets/RENOVATION/outlooks/20 Home Exterior Makeover Before and After Ideas _ Home Stories A to Z (1).jpg', 'title': 'More Exterior Makeover Ideas'},
    {'path': 'assets/RENOVATION/outlooks/21 Painted Houses to Inspire You in 2021.jpg', 'title': 'Painted Houses'},
    {'path': 'assets/RENOVATION/outlooks/25 Front Porch Decorating Ideas to Make Your Entry More Inviting.jpg', 'title': 'Front Porch Decorating Ideas'},
    {'path': 'assets/RENOVATION/outlooks/34+ Inspirational Before And After House Renovation Projects.jpg', 'title': 'Inspirational House Renovations'},
    {'path': 'assets/RENOVATION/outlooks/34 Incredible Before-and-After Exterior Home Remodels.jpg', 'title': 'Before-and-After Home Remodels'},
    {'path': 'assets/RENOVATION/outlooks/34c7ab30-f25d-4c44-a23e-f0bc70a29063.jpg', 'title': 'Exterior Renovation Ideas'},
    {'path': 'assets/RENOVATION/outlooks/50 Before-and-After Backyard Makeovers - Hey, How to do it_.jpg', 'title': 'Backyard Makeovers'},
    {'path': 'assets/RENOVATION/outlooks/65 Wow-Worthy Home Makeovers.jpg', 'title': 'Wow-Worthy Home Makeovers'},
    {'path': 'assets/RENOVATION/outlooks/727cf596-d575-4b93-9061-8cc37b98001a.jpg', 'title': 'Beautiful House Makeover'},
    {'path': 'assets/RENOVATION/outlooks/935cdcd7-5055-4236-83df-d6c3266f04a4.jpg', 'title': 'Modern Home Renovation'},
    {'path': 'assets/RENOVATION/outlooks/4206d169-5fbf-4a3e-8cab-514e4e30b0e4.jpg', 'title': 'Exterior Design Ideas'},
    {'path': 'assets/RENOVATION/outlooks/15555973-5c02-4129-affa-87e10d7d2902.jpg', 'title': 'Front Door Design Ideas'},
    {'path': 'assets/RENOVATION/outlooks/Amazing Exterior Home Transformations Start with Windows and Doors.jpg', 'title': 'Window and Door Transformations'},
    {'path': 'assets/RENOVATION/outlooks/Before&After Design on Instagram_ “SWIPE ➡️➡️….jpg', 'title': 'Instagram Design Swipe'},
    {'path': 'assets/RENOVATION/outlooks/Before & After_ Exterior Paint & Covered Porch Transform Home.jpg', 'title': 'Exterior Paint and Porch'},
    {'path': 'assets/RENOVATION/outlooks/Before and After.jpg', 'title': 'Before and After'},
    {'path': 'assets/RENOVATION/outlooks/Before and After _Home Renovation.jpg', 'title': 'Home Renovation Before and After'},
    {'path': 'assets/RENOVATION/outlooks/Before and After_ 4 Top Tips To Give Your Home a Face Lift _ L\'Essenziale.jpg', 'title': 'Top Tips for Home Renovation'},
    {'path': 'assets/RENOVATION/outlooks/Before-After-Design-Makeovers.jpg', 'title': 'Design Makeovers'},
    {'path': 'assets/RENOVATION/outlooks/c77e5a19-ca84-43d7-8c66-4eedf9cab464.jpg', 'title': 'Exterior Remodel'},
    {'path': 'assets/RENOVATION/outlooks/Can A Raised Ranch Home Become A Traditional Home_.jpg', 'title': 'Raised Ranch Remodel'},
    {'path': 'assets/RENOVATION/outlooks/Craftsman versus Ranch Remodel Decisions.jpg', 'title': 'Craftsman vs Ranch Remodel'},
    {'path': 'assets/RENOVATION/outlooks/DIY Cedar Window Planters - Shades of Blue Interiors.jpg', 'title': 'DIY Cedar Window Planters'},
    {'path': 'assets/RENOVATION/outlooks/download.jpg', 'title': 'Download Exterior Ideas'},
    {'path': 'assets/RENOVATION/outlooks/Extension & Exterior Remodel.jpg', 'title': 'Extension and Exterior Remodel'},
    {'path': 'assets/RENOVATION/outlooks/Exterior Paint Trends For 2018.jpg', 'title': 'Exterior Paint Trends 2018'},
    {'path': 'assets/RENOVATION/outlooks/fd0ad3ea-9abf-423b-909d-96cafb52aa25.jpg', 'title': 'Modern Exterior Paint Ideas'},
    {'path': 'assets/RENOVATION/outlooks/front of house renovation ideas uk.jpg', 'title': 'UK House Renovation Ideas'},
    {'path': 'assets/RENOVATION/outlooks/How to renovate for profit in 3 weeks.jpg', 'title': 'Renovation for Profit'},
    {'path': 'assets/RENOVATION/outlooks/Modern Navy and Cedar Ranch Style Remodel.jpg', 'title': 'Navy and Cedar Ranch Remodel'},
    {'path': 'assets/RENOVATION/outlooks/Online Home Exterior Design Services _ brick&batten.jpg', 'title': 'Online Exterior Design Services'},
    {'path': 'assets/RENOVATION/outlooks/Our Home Remodel _ Home Renovation Tips.jpg', 'title': 'Home Renovation Tips'},
    {'path': 'assets/RENOVATION/outlooks/Our Last House - Seeking Lavender Lane.jpg', 'title': 'Our Last House'},
    {'path': 'assets/RENOVATION/outlooks/Our Modest Starter Home Might Be Our Forever Home_.jpg', 'title': 'Modest Starter Home'},
    {'path': 'assets/RENOVATION/outlooks/Painted Brick Houses.jpg', 'title': 'Painted Brick Houses'},
    {'path': 'assets/RENOVATION/outlooks/Porticos Gallery - GFP.jpg', 'title': 'Porticos Design Gallery'},
    {'path': 'assets/RENOVATION/outlooks/Proposed Exterior Renovation.jpg', 'title': 'Proposed Exterior Renovation'},
    {'path': 'assets/RENOVATION/outlooks/Ranch Homes Before & After Makeover _ Blog _ brick&batten.jpg', 'title': 'Ranch Homes Before & After'},
    {'path': 'assets/RENOVATION/outlooks/Rebirth_ Our 1960s Ranch House Renovation _ Transforming the Front Elevation - Redeem Your Ground.jpg', 'title': '1960s Ranch House Renovation'},
    {'path': 'assets/RENOVATION/outlooks/Remodelled, rewired and rejuvenated - Turner and Hoskins Architects.jpg', 'title': 'Remodel and Rewire'},
    {'path': 'assets/RENOVATION/outlooks/Split Entry Stock Home Plans _ KDK Design Store.jpg', 'title': 'Split Entry Stock Home Plans'},

  ];

  // List to hold filtered images
  List<Map<String, String>> filteredImages = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent * _animation.value);
        });
      });
    _animationController.repeat(reverse: false);

    filteredImages = allImagePaths;

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _filterImages(String query) {
    final filtered = allImagePaths.where((image) {
      final titleLower = image['title']!.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      filteredImages = filtered;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: const Text('Sign up'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Search bar
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
                  hintText: 'Search 18 million+ shots...',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: _filterImages,
              ),
              const SizedBox(height: 20),

              // Trending Searches Title
              const Text(
                'Trending Searches',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Horizontal Scroll View for Trending Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    trendingSearchChip('living room ideas'),
                    trendingSearchChip('modern decor'),
                    trendingSearchChip('kitchen designs'),
                    trendingSearchChip('bedroom decor'),
                    trendingSearchChip('home office ideas'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Newly added ListView of Feature Cards
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  children: [
                    featureCard('Home', Icons.home, context),
                    featureCard('Offices', Icons.business, context),
                    featureCard('Interior', Icons.bed, context),
                    featureCard('Exterior', Icons.landscape, context),
                    featureCard('Buildings', Icons.apartment, context),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Grid of Filtered Images
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemCount: filteredImages.length,
                itemBuilder: (context, index) {
                  return exploreMoreImageGrid(
                    context,
                    filteredImages[index]['path']!,
                    filteredImages[index]['title']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget trendingSearchChip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: () {
          _searchController.text = label;
          _filterImages(label);
        },
        child: Chip(
          label: Text(label),
          backgroundColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget featureCard(String title, IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == 'Home') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeGridPage()),
          );
        } else if (title == 'Offices') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OfficesDesignPage()),
          );
        } else if (title == 'Interior') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InteriorDesignPage()),
          );
        } else if (title == 'Exterior') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ExteriorDesignPage()),
          );
        } else if (title == 'Buildings') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BuildingDesignPage()),
          );
        }
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.brown),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget exploreMoreImageGrid(BuildContext context, String imageUrl, String title) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
