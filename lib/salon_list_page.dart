import 'package:flutter/material.dart';
import 'V-cut.dart';
import 'search_page.dart'; // ✅ Make sure this file exists
import 'landing_page/salon_card.dart';

class SalonListPage extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const SalonListPage({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  State<SalonListPage> createState() => _SalonListPageState();
}

class _SalonListPageState extends State<SalonListPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final salons = [
      {
        'name': 'V-cut',
        'location': 'Hulimavu',
        'rating': 4.9,
        'imageUrl':'https://images.fresha.com/locations/location-profile-images/437841/1995450/2d8a39d4-2c1b-4109-a46a-e39681dfbdb1-Blown-Indiranagar-IN-Karnataka-Bangalore-Indiranagar-Fresha.jpg',
      }
      ,
      {
        'name': 'V-cut Unisex',
        'location': 'BTM Layout',
        'rating': 4.8,
        'imageUrl': 'assets/salon.png',
      },
      {
        'name': 'Vcut Spa Lounge',
        'location': 'HSR Layout',
        'rating': 4.7,
        'imageUrl': 'https://images.fresha.com/locations/location-profile-images/72961/2039300/c3133a8a-63a4-432c-bdec-2538097924eb-EssentialBeautySalon-AE-Dubai-Dubai-JumeirahJumeirah3-Fresha.jpg?class=venue-gallery-large&dpr=2', // Barber chair and tools
      },
      {
        'name': 'Vcut Hair Studio',
        'location': 'Indiranagar',
        'rating': 4.6,
        'imageUrl': 'https://images.fresha.com/locations/location-profile-images/72961/2039300/c3133a8a-63a4-432c-bdec-2538097924eb-EssentialBeautySalon-AE-Dubai-Dubai-JumeirahJumeirah3-Fresha.jpg?class=venue-gallery-large&dpr=2', // Barber chair and tools
      },
    ];

    final newSalons = [
      {
        'name': 'Vcut Beauty Lounge',
        'location': 'Koramangala',
        'rating': 4.5,
        'imageUrl': 'https://images.fresha.com/locations/location-profile-images/72961/2039300/c3133a8a-63a4-432c-bdec-2538097924eb-EssentialBeautySalon-AE-Dubai-Dubai-JumeirahJumeirah3-Fresha.jpg?class=venue-gallery-large&dpr=2', // Barber chair and tools
      },
      {
        'name': 'Vcut Style Point',
        'location': 'Marathahalli',
        'rating': 4.4,
        'imageUrl': 'https://images.fresha.com/locations/location-profile-images/72961/2039300/c3133a8a-63a4-432c-bdec-2538097924eb-EssentialBeautySalon-AE-Dubai-Dubai-JumeirahJumeirah3-Fresha.jpg?class=venue-gallery-large&dpr=2', // Barber chair and tools
      },
      {
        'name': 'Vcut ',
        'location': 'Koramangala',
        'rating': 4.5,
        'imageUrl': 'https://images.fresha.com/locations/location-profile-images/72961/2039300/c3133a8a-63a4-432c-bdec-2538097924eb-EssentialBeautySalon-AE-Dubai-Dubai-JumeirahJumeirah3-Fresha.jpg?class=venue-gallery-large&dpr=2', // Barber chair and tools
      },
      {
        'name': 'Vcut Style salon',
        'location': 'Marathahalli',
        'rating': 4.4,
        'imageUrl': 'https://images.fresha.com/locations/location-profile-images/72961/2039300/c3133a8a-63a4-432c-bdec-2538097924eb-EssentialBeautySalon-AE-Dubai-Dubai-JumeirahJumeirah3-Fresha.jpg?class=venue-gallery-large&dpr=2', // Barber chair and tools
      },
    ];

    final List<Map<String, dynamic>> categories = [
      {'name': 'Hair & styling', 'icon': Icons.content_cut},
      {'name': 'Spa', 'icon': Icons.spa},
      {'name': 'Facial', 'icon': Icons.face},
      {'name': 'Nails', 'icon': Icons.brush},
      {'name': 'Haircut', 'icon': Icons.cut},
      {'name': 'Massage', 'icon': Icons.self_improvement},
      {'name': 'Makeup', 'icon': Icons.palette},
      {'name': 'Skincare', 'icon': Icons.healing},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Salon', style: theme.textTheme.titleLarge),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Text('Hey, Joshna', style: theme.textTheme.headlineSmall),
            const SizedBox(height: 20),
            Text('Recently viewed', style: theme.textTheme.titleLarge),
            const SizedBox(height: 10),

            // Recently Viewed
            SalonCard(
              name: salons[0]['name'] as String,
              location: salons[0]['location'] as String,
              rating: salons[0]['rating'] as double,
              imageUrl: salons[0]['imageUrl'] as String,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const Vcut()));
              },
            ),

            const SizedBox(height: 20),
            Text('Recommended', style: theme.textTheme.titleLarge),
            const SizedBox(height: 10),

            // Recommended scroll
            SizedBox(
              height: 250,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: salons.length - 1,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, index) {
                  final salon = salons[index + 1];
                  return SizedBox(
                    width: 200,
                    child: SalonCard(
                      name: salon['name'] as String,
                      location: salon['location'] as String,
                      rating: salon['rating'] as double,
                      imageUrl: salon['imageUrl'] as String,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const Vcut()));
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
            Text('New to 3S Salons', style: theme.textTheme.titleLarge),
            const SizedBox(height: 10),

            SizedBox(
              height: 250,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: newSalons.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, index) {
                  final salon = newSalons[index];
                  return SizedBox(
                    width: 200,
                    child: SalonCard(
                      name: salon['name'] as String,
                      location: salon['location'] as String,
                      rating: salon['rating'] as double,
                      imageUrl: salon['imageUrl'] as String,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const Vcut()));
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
            Text('Categories', style: theme.textTheme.titleLarge),
            const SizedBox(height: 10),

            // ✅ GridView for Categories
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (_, index) {
                final category = categories[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade900,
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        category['icon'] as IconData,
                        size: 48,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category['name'] as String,
                        style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.yellow.shade800,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SearchPage()));
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'theme.dart'; // ✅ make sure this points to the correct file
import 'V-cut.dart';
import 'contact_page.dart';
import 'search_page.dart';
import 'V-cut_yel.dart';
import 'package:world_time_app/V-cut_unisex.dart' as hulimavu;
import 'package:world_time_app/v-cut_hsr.dart' as hsr;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleThemeMode() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: salonLightTheme, // 👈 from theme.dart
      darkTheme: salonDarkTheme, // 👈 from theme.dart
      themeMode: _themeMode, // 👈 toggled value
      home: CardSelectionScreen(onToggleTheme: _toggleThemeMode),
    );
  }
}

class CardSelectionScreen extends StatefulWidget {
  final VoidCallback onToggleTheme; // 👈 Add this

  const CardSelectionScreen({super.key, required this.onToggleTheme});

  @override
  State<CardSelectionScreen> createState() => _CardSelectionScreenState();
}


class _CardSelectionScreenState extends State<CardSelectionScreen> {
  int? selectedRecommended, selectedNew;
  int _selectedIndex = 0;

  final recommended = [
    {
      "name": "V-cut",
      "location": "Hulimavu",
      "rating": "4.9",
      "image": "https://images.fresha.com/locations/location-profile-images/72961/2039300/c3133a8a-63a4-432c-bdec-2538097924eb-EssentialBeautySalon-AE-Dubai-Dubai-JumeirahJumeirah3-Fresha.jpg?class=venue-gallery-large&dpr=2"
    },
    {
      "name": "V-cut Unisex",
      "location": "Hulimavu",
      "rating": "4.9",
      "image": "https://images.fresha.com/locations/location-profile-images/437841/1995450/2d8a39d4-2c1b-4109-a46a-e39681dfbdb1-Blown-Indiranagar-IN-Karnataka-Bangalore-Indiranagar-Fresha.jpg?class=venue-gallery-mobile&dpr=2&watermark=true"
    },
    {
      "name": "V_cut hsr",
      "location": "HSR layout",
      "rating": "5.0",
      "image":
      "https://images.fresha.com/locations/location-profile-images/437841/1995452/80acd17a-9f22-447e-b7dd-a18d2b4b2e84-Blown-Indiranagar-IN-Karnataka-Bangalore-Indiranagar-Fresha.jpg?class=venue-gallery-mobile&dpr=2&watermark=true"
    },
    {
      "name": "V-Cut yel",
      "location": "Yelahanka",
      "rating": "4.9",
      "image":
      "https://images.fresha.com/locations/location-profile-images/72961/2039300/c3133a8a-63a4-432c-bdec-2538097924eb-EssentialBeautySalon-AE-Dubai-Dubai-JumeirahJumeirah3-Fresha.jpg?class=venue-gallery-large&dpr=2"
    },
    {
      "name": "Essential Beauty Salon",
      "location": "Begur",
      "rating": "4.9",
      "image":
      "https://images.fresha.com/locations/location-profile-images/437841/1995450/2d8a39d4-2c1b-4109-a46a-e39681dfbdb1-Blown-Indiranagar-IN-Karnataka-Bangalore-Indiranagar-Fresha.jpg?class=venue-gallery-mobile&dpr=2&watermark=true"
    },
  ];

  final newSalons = [
    {
      "name": "Glow Up Studio",
      "location": "Yedur",
      "rating": "4.8",
      "image": "https://images.fresha.com/locations/location-profile-images/437841/1995452/80acd17a-9f22-447e-b7dd-a18d2b4b2e84-Blown-Indiranagar-IN-Karnataka-Bangalore-Indiranagar-Fresha.jpg?class=venue-gallery-mobile&dpr=2&watermark=true"
    },
    {
      "name": "V-cut",
      "location": "Hulimavu",
      "rating": "4.9",
      "image": "https://images.fresha.com/locations/location-profile-images/437841/1995455/95ccef5d-57b3-4aa2-ae53-e69a2c37dd13-Blown-Indiranagar-IN-Karnataka-Bangalore-Indiranagar-Fresha.jpg?class=venue-gallery-mobile&dpr=2&watermark=true"
    },
    {
      "name": "V-cut hsr",
      "location": "HSR layout",
      "rating": "5.0",
      "image":
      "https://images.fresha.com/locations/location-profile-images/437841/1995452/80acd17a-9f22-447e-b7dd-a18d2b4b2e84-Blown-Indiranagar-IN-Karnataka-Bangalore-Indiranagar-Fresha.jpg?class=venue-gallery-mobile&dpr=2&watermark=true"
    },
    {
      "name": "V-Cut yel",
      "location": "Yelahanka",
      "rating": "4.9",
      "image":
      "https://images.fresha.com/locations/location-profile-images/72961/2039300/c3133a8a-63a4-432c-bdec-2538097924eb-EssentialBeautySalon-AE-Dubai-Dubai-JumeirahJumeirah3-Fresha.jpg?class=venue-gallery-large&dpr=2"
    },
    {
      "name": "Essential Beauty Salon",
      "location": "Begur",
      "rating": "4.9",
      "image":
      "https://images.fresha.com/locations/location-profile-images/437841/1995450/2d8a39d4-2c1b-4109-a46a-e39681dfbdb1-Blown-Indiranagar-IN-Karnataka-Bangalore-Indiranagar-Fresha.jpg?class=venue-gallery-mobile&dpr=2&watermark=true"
    },
  ];

  final categories = [
    {"title": "Hair & styling", "image": "https://d29i8jsbyudm3e.cloudfront.net/business_extra_5715305.jpg"},
    {"title": "Nails", "image": "https://lh5.googleusercontent.com/proxy/oos4iybTvNSS7OYZDLYu34KLPLGRP_BTYFrkkeZFfxppgV-Zx26X5eMJZM3Zn_YBKBAdTy2gkSl1yyKQrz1bpMfGYUu_8I1ezMbnBKUw5Jqdho-Wubno8g"},
    {"title": "Eyebrows & eyelashes", "image": "https://images.fresha.com/locations/location-profile-images/93348/2602534/0b82b125-da63-4721-87b4-ccc118869dc9-SKYEyeLashExtensionNailBeautyStudio-AU-WesternAustralia-GoldenBay-Fresha.jpg?class=width-small"},
    {"title": "Massage", "image": "https://www.shutterstock.com/image-photo/young-european-woman-enjoying-relaxation-600nw-2497508865.jpg"},
    {"title": "Barbering", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1zqKETgiGZ4O-fGP6ZCdY5Xf17xyg55mpuw&s"},
    {"title": "Hair removal", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl4WadtEhklSpw-M9H0Q8w6e9kB9UjXzY4fg&s"},
    {"title": "Facials & skincare", "image":
    "https://www.shutterstock.com/image-photo/young-european-woman-enjoying-relaxation-600nw-2497508865.jpg"},
    {"title": "Injectables & fillers", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1zqKETgiGZ4O-fGP6ZCdY5Xf17xyg55mpuw&s"},
    {"title": "Body", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1zqKETgiGZ4O-fGP6ZCdY5Xf17xyg55mpuw&s"},
    {"title": "Tattoo & piercing", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1zqKETgiGZ4O-fGP6ZCdY5Xf17xyg55mpuw&s"},
    {"title": "Makeup", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1zqKETgiGZ4O-fGP6ZCdY5Xf17xyg55mpuw&s"},
    {"title": "Medical & dental", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1zqKETgiGZ4O-fGP6ZCdY5Xf17xyg55mpuw&s"},
    {"title": "Counseling & holistic", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1zqKETgiGZ4O-fGP6ZCdY5Xf17xyg55mpuw&s"},
    {"title": "Fitness", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1zqKETgiGZ4O-fGP6ZCdY5Xf17xyg55mpuw&s"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a Salon"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            tooltip: "Toggle Theme",
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("Hey, Joshna", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            ),
            // Recently viewed section
            _sectionTitle("Recently viewed"),
            SalonCardList(
              salons: [recommended[0]],
              selectedIndex: null,
              onCardTap: (i) => _navigateToSalon(recommended[0]["name"]!),
            ),
            const SizedBox(height: 32), // Space after "Recently viewed" section

            // Recommended section
            _sectionTitle("Recommended"),
            SalonCardList(
              salons: recommended,
              selectedIndex: selectedRecommended,
              onCardTap: (i) {
                setState(() => selectedRecommended = i);
                _navigateToSalon(recommended[i]["name"]!);
              },
            ),
            const SizedBox(height: 32), // Space after "Recommended" section

            // New to 3S salons section
            _sectionTitle("New to 3S salons"),
            SalonCardList(
              salons: newSalons,
              selectedIndex: selectedNew,
              onCardTap: (i) {
                setState(() => selectedNew = i);
                _navigateToSalon(newSalons[i]["name"]!);
              },
            ),
            const SizedBox(height: 32), // Space after "New to 3S salons" section

            // Categories section
            _sectionTitle("Categories"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16, // Spacing between grid items
                  crossAxisSpacing: 16, // Spacing between grid items
                  childAspectRatio: 3 / 2.3,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Category cards remain white
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Image.network(
                            category["image"]!,
                            height: 90,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12), // Padding here
                          child: Text(
                            category["title"]!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // --- THEME CHANGE: Selected item color to primary (red) ---
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => NearbySalonsPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ContactPage()),
            );
          }
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _navigateToSalon(String name) {
    final lowerName = name.toLowerCase();

    if (lowerName == 'v-cut') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const Vcut()));
    } else if (lowerName == 'v-cut unisex') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const hulimavu.VcutUnisexHulimavu()));
    } else if (lowerName == 'v_cut hsr' || lowerName == 'v-cut hsr') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const hsr.VCutHSR()));
    } else if (lowerName == 'v-cut yel' || lowerName == 'v_cut yel') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const VcutYelahanka()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No page available for $name')),
      );
    }
  }

  Widget _sectionTitle(String title) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
    child: Text(
      title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    ),
  );
}

class SalonCardList extends StatelessWidget {
  final List<Map<String, String>> salons;
  final int? selectedIndex;
  final void Function(int) onCardTap;

  const SalonCardList({
    super.key,
    required this.salons,
    required this.selectedIndex,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260, // ✅ increased height to fix overflow
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: salons.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final salon = salons[index];
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onCardTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(2, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                    child: Image.network(
                      salon["image"]!,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          salon["name"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          salon["location"]!,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              salon["rating"]!,
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Salon",
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
*/
