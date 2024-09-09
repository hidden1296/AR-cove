import 'dart:async';
import 'package:arcovefinal/features/design-catalog/building/building_desings.dart';
import 'package:arcovefinal/features/design-catalog/exterior/exterior.dart';
import 'package:arcovefinal/features/design-catalog/interior/interior_designs.dart';
import 'package:arcovefinal/features/design-catalog/office/office_designs.dart';
import 'package:flutter/material.dart';
import '../features/design-catalog/design_catalog.dart';
import '../features/professinal/professional.dart';
import '../features/realistic_desing_visualization/realistic_design_visualization.dart';
import '../login/login.dart';
import '../navbar/bottom_nav_bar.dart';
import '../sign_up/sign_up.dart';
import 'agents/property details.dart';
import 'agents/property.dart';
import 'placeholder.dart';
import 'setting.dart';
import 'professional_setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController1 = PageController(viewportFraction: 0.8);
  Timer? _timer1;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _timer1 = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController1.page == 4) {
        _pageController1.animateToPage(0, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
      } else {
        _pageController1.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void dispose() {
    _pageController1.dispose();
    _timer1?.cancel();
    super.dispose();
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
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text(
          'ARCOVE',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: const Text('Sign up'),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFB46146),
              ),
              child: Text(
                'ARCOVE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text('Saved'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PlaceholderPage(title: 'Saved')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PlaceholderPage(title: 'Notifications')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('Consultation'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfessionalPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Sign Up'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
              title: const Text('John Smith'),
              subtitle: const Text('johnsmith@gmail.com'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfessionalSettingPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Container with background color
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Text(
                  'Over 3 million ready-to-work creatives!',
                  style: TextStyle(
                    color: Color(0xFFB46146),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'The world’s destination\nfor design',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Get inspired by the work of millions of top-rated designers & agencies around the world.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB46146),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                child: const Text(
                  'Get started',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Feature Slider
              SizedBox(
                height: 200,
                child: PageView(
                  controller: _pageController1,
                  children: [
                    featureContainer(context, 'Design Catalog', Icons.design_services, const DesignCatalogPage()),
                    featureContainer(context, 'Professional Consultation', Icons.business, ProfessionalPage()),
                    featureContainer(context, 'Property', Icons.person, PropertyPage()),
                    featureContainer(context, 'Renovation Ideas And Inspiration', Icons.lightbulb, const PlaceholderPage(title: 'Renovation Ideas And Inspiration')),
                    featureContainer(context, 'Realistic Design Visualization', Icons.visibility, RealisticDesignVisualization()),
                    featureContainer(context, 'Budgeting And Cost Estimation', Icons.attach_money, const PlaceholderPage(title: 'Budgeting And Cost Estimation')),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Feature Buttons in Single Row with horizontal scroll
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    featureCardButton('Interior Designing', Icons.home, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InteriorDesignPage(),
                        ),
                      );
                    }),
                    featureCardButton('Exterior Designing', Icons.landscape, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ExteriorDesignPage(),
                        ),
                      );
                    }),
                    featureCardButton('Building Designing', Icons.apartment, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BuildingDesignPage(),
                        ),
                      );
                    }),
                    featureCardButton('Office Designing', Icons.business_center, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OfficesDesignPage(),
                        ),
                      );
                    }),
                    featureCardButton('Furniture Designing', Icons.chair, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlaceholderPage(title: 'Furniture Designing'),
                        ),
                      );
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              // Explore More Section
              exploreMoreSection(context),
              // Review Section
              reviewSection(),
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

  Widget featureContainer(BuildContext context, String title, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFFB46146), // Use solid color instead of background image
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget featureCardButton(String title, IconData icon, VoidCallback onPressed) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isTapped = false;
        return GestureDetector(
          onTapDown: (_) => setState(() => isTapped = true),
          onTapUp: (_) => setState(() => isTapped = false),
          onTapCancel: () => setState(() => isTapped = false),
          onTap: onPressed,
          child: AnimatedScale(
            scale: isTapped ? 1.2 : 1.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFB46146), // Use solid color instead of background image
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: Colors.white, size: 20),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget exploreMoreSection(BuildContext context) {
    List<Map<String, String>> dummyData = [
      {
        'url': 'https://via.placeholder.com/150',
        'title': 'Design 1',
        'designer': 'Designer 1',
        'status': 'Completed',
        'likes': '10',
        'views': '100'
      },
      {
        'url': 'https://via.placeholder.com/150',
        'title': 'Design 2',
        'designer': 'Designer 2',
        'status': 'In Progress',
        'likes': '15',
        'views': '150'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Explore More',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                // Replace with any other navigation or functionality
              },
              child: const Row(
                children: [
                  Text('See All'),
                  Icon(Icons.arrow_right),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: dummyData.map((doc) {
              return ExploreMoreImage(
                imageUrl: doc['url']!,
                title: doc['title']!,
                designer: doc['designer']!,
                status: doc['status']!,
                likes: doc['likes']!,
                views: doc['views']!,
                onLike: () {
                  // Replace with any other functionality
                },
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Explore inspiring designs',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1, // Adjusted to fit the content
          ),
          itemCount: dummyData.length,
          itemBuilder: (context, index) {
            var doc = dummyData[index];
            return ExploreMoreImage(
              imageUrl: doc['url']!,
              title: doc['title']!,
              designer: doc['designer']!,
              status: doc['status']!,
              likes: doc['likes']!,
              views: doc['views']!,
              onLike: () {
                // Replace with any other functionality
              },
            );
          },
        ),
      ],
    );
  }

  Widget reviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text(
          'Customer Reviews',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        reviewCard('John Doe', 'Great service, highly recommend!', 4),
        reviewCard('Jane Smith', 'Very professional and reliable.', 5),
        reviewCard('Alice Johnson', 'Good value for the price.', 4),
      ],
    );
  }

  Widget reviewCard(String name, String review, int rating) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(review),
            const SizedBox(height: 4),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.yellow,
                  size: 20,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class ArTab extends StatelessWidget {
  const ArTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('AR Tab Content'),
    );
  }
}

class ProsTab extends StatelessWidget {
  const ProsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfessionalPage();
  }
}

class ProfessionalCard extends StatelessWidget {
  final String? avatarUrl;
  final String name;
  final double? rating;

  const ProfessionalCard({super.key, required this.name, this.avatarUrl, this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            avatarUrl != null
                ? CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl!),
              radius: 30.0,
            )
                : Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  color: Colors.grey[400],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              name,
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 16.0,
                ),
                Text(rating?.toStringAsFixed(1) ?? "-"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExploreMoreImage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String designer;
  final String status;
  final String likes;
  final String views;
  final VoidCallback onLike;

  const ExploreMoreImage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.designer,
    required this.status,
    required this.likes,
    required this.views,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  designer,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  'Status: $status',
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Likes: $likes',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Views: $views',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                IconButton(
                  icon: const Icon(Icons.thumb_up, color: Colors.white),
                  onPressed: onLike,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
