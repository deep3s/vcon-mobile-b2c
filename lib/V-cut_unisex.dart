import 'package:flutter/material.dart';

class VcutUnisexHulimavu extends StatefulWidget {
  const VcutUnisexHulimavu({super.key});

  @override
  State<VcutUnisexHulimavu> createState() => _VcutUnisexHulimavuState();
}

class _VcutUnisexHulimavuState extends State<VcutUnisexHulimavu> {
  bool isFavorite = false;
  int currentIndex = 0;

  final List<String> images = [
    'https://media.istockphoto.com/id/1856117770/photo/modern-beauty-salon.jpg?s=612x612&w=0&k=20&c=dVZtsePk2pgbqDXwVkMm-yIw5imnZ2rnkAruR7zf8EA=',
    'https://www.w3schools.com/w3images/fjords.jpg',
  ];

  final List<Map<String, dynamic>> services = [
    {'name': 'Haircut + Hair Spa', 'duration': '1 hr', 'price': '₹800', 'discount': '20%'},
    {'name': 'Facial Treatment', 'duration': '45 mins', 'price': '₹1,200', 'discount': '30%'},
    {'name': 'Manicure & Pedicure', 'duration': '1.5 hrs', 'price': '₹1,500', 'discount': '15%'},
  ];

  final List<Map<String, String>> team = [
    {'name': 'Anjali', 'speciality': 'Hair Stylist'},
    {'name': 'Divya', 'speciality': 'Beauty Therapist'},
  ];

  final List<Map<String, String>> timings = [
    {'day': 'Monday', 'from': '09:00 AM', 'to': '10:00 PM'},
    {'day': 'Tuesday', 'from': '09:00 AM', 'to': '10:00 PM'},
    {'day': 'Wednesday', 'from': '09:00 AM', 'to': '10:00 PM'},
    {'day': 'Thursday', 'from': '09:00 AM', 'to': '10:00 PM'},
    {'day': 'Friday', 'from': '09:00 AM', 'to': '10:00 PM'},
    {'day': 'Saturday', 'from': '09:00 AM', 'to': '10:00 PM'},
    {'day': 'Sunday', 'from': '09:00 AM', 'to': '10:00 PM'},
  ];

  final List<Map<String, dynamic>> venuesNearby = [
    {
      'image': 'https://www.w3schools.com/w3images/fjords.jpg',
      'name': 'Vcut JP Nagar',
      'reviews': ['Clean space', 'Friendly staff'],
    },
    {
      'image': 'https://www.w3schools.com/w3images/fjords.jpg',
      'name': "Vcut Bannerghatta",
      'reviews': ['Neat environment', 'Affordable rates'],
    },
  ];

  final List<Map<String, String>> locations = [
    {'name': 'Branch A', 'address': 'Lake View Road', 'image': 'assets/location1.jpg'},
    {'name': 'Branch B', 'address': 'Gurukrupa Layout', 'image': 'assets/location2.jpg'},
    {'name': 'Branch C', 'address': 'BTM Layout', 'image': 'assets/location3.jpg'},
    {'name': 'Branch D', 'address': 'JP Nagar', 'image': 'assets/location4.jpg'},
    {'name': 'Branch E', 'address': 'HSR Layout', 'image': 'assets/location5.jpg'},
    {'name': 'Branch F', 'address': 'Electronic City', 'image': 'assets/location6.jpg'},
  ];

  List<Map<String, String>> get visibleLocations {
    int endIndex = currentIndex + 5;
    if (endIndex > locations.length) {
      endIndex = locations.length;
    }
    return locations.sublist(currentIndex, endIndex);
  }

  void moveLeft() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
    }
  }

  void moveRight() {
    if (currentIndex < locations.length - 1) {
      setState(() => currentIndex++);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('V-Cut Unisex Hulimavu'),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () => setState(() => isFavorite = !isFavorite),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 200,
            child: PageView(
              children: images
                  .map((url) => ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(url, fit: BoxFit.cover),
              ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Available Services', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...services.map((service) => ListTile(
            title: Text(service['name']),
            subtitle: Text('${service['duration']} • ${service['price']}'),
            trailing: Text('${service['discount']} OFF', style: const TextStyle(color: Colors.green)),
          )),
          const Divider(),
          const Text('Our Team', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ...team.map((member) => ListTile(
            leading: const Icon(Icons.person),
            title: Text(member['name']!),
            subtitle: Text(member['speciality']!),
          )),
          const Divider(),
          const Text('Opening Hours', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ...timings.map((time) => ListTile(
            title: Text(time['day']!),
            trailing: Text('${time['from']} - ${time['to']}'),
          )),
          const Divider(),
          const Text('Venues Nearby', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ...venuesNearby.map((venue) => ListTile(
            leading: Image.network(venue['image'], width: 60, height: 60, fit: BoxFit.cover),
            title: Text(venue['name']),
            subtitle: Text(venue['reviews'].join(', ')),
          )),
          const Divider(),
          const Text('Nearby Locations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: moveLeft, icon: const Icon(Icons.arrow_back_ios)),
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: visibleLocations.length,
                    itemBuilder: (context, index) {
                      final loc = visibleLocations[index];
                      return Container(
                        width: 140,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(loc['image']!, fit: BoxFit.cover),
                            ),
                            Text(loc['name']!, style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              IconButton(onPressed: moveRight, icon: const Icon(Icons.arrow_forward_ios)),
            ],
          )
        ],
      ),
    );
  }
}
