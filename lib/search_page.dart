import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:world_time_app/landing_page/salon_card.dart';

class NearbySalonsPage extends StatefulWidget {
  const NearbySalonsPage({Key? key}) : super(key: key);

  @override
  _NearbySalonsPageState createState() => _NearbySalonsPageState();
}

class _NearbySalonsPageState extends State<NearbySalonsPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(12.8952, 77.6140); // Akshayanagar

  // Filter state variables
  String _selectedSort = 'recommended';
  String _selectedPrice = 'low_to_high';
  String _selectedType = 'unisex';

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapToolbarEnabled: true,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  // Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.black),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'All treatments',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(Icons.menu, color: Colors.black),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Filter Row
                  Row(
                    children: [
                      // Sort Dropdown
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          setState(() {
                            _selectedSort = value;
                            print('Selected Sort: $_selectedSort');
                          });
                        },
                        itemBuilder: (context) => const [
                          PopupMenuItem(value: 'recommended', child: Text('Recommended')),
                          PopupMenuItem(value: 'nearest', child: Text('Nearest')),
                          PopupMenuItem(value: 'toprated', child: Text('Top Rated')),
                        ],
                        offset: const Offset(0, 45),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: Colors.white,
                        child: _dropdownButton(icon: Icons.tune, label: "Sort"),
                      ),

                      const SizedBox(width: 8),

                      // Price Dropdown
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          setState(() {
                            _selectedPrice = value;
                            print('Selected Price: $_selectedPrice');
                          });
                        },
                        itemBuilder: (context) => const [
                          PopupMenuItem(value: 'low_to_high', child: Text('Low to High')),
                          PopupMenuItem(value: 'high_to_low', child: Text('High to Low')),
                        ],
                        offset: const Offset(0, 45),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: Colors.white,
                        child: _dropdownButton(icon: Icons.attach_money, label: "Price"),
                      ),

                      const SizedBox(width: 8),

                      // Type Dropdown
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          setState(() {
                            _selectedType = value;
                            print('Selected Type: $_selectedType');
                          });
                        },
                        itemBuilder: (context) => const [
                          PopupMenuItem(value: 'unisex', child: Text('Unisex')),
                          PopupMenuItem(value: 'men', child: Text('Men')),
                          PopupMenuItem(value: 'women', child: Text('Women')),
                        ],
                        offset: const Offset(0, 45),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: Colors.white,
                        child: _dropdownButton(icon: Icons.category, label: "Type"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          // Bottom draggable list of salons
          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              initialChildSize: 0.35,
              minChildSize: 0.2,
              maxChildSize: 0.8,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(16),
                    children: const [
                      Center(
                        child: SizedBox(
                          width: 40,
                          height: 4,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(2)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text("55 venues nearby", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 16),

                      // Example salons
                      SalonCard(
                        title: "V-cut unisex",
                        rating: 4.8,
                        reviews: 613,
                        location: "Akshayanagar, Bengaluru",
                        image: 'assets/eeva_spa_logo.png',
                      ),
                      SalonCard(
                        title: "V-cut salon",
                        rating: 4.8,
                        reviews: 613,
                        location: "Hulimavu, Bengaluru",
                        image: 'assets/eeva_spa_logo.png',
                      ),
                      SalonCard(
                        title: "V-cut salon",
                        rating: 4.8,
                        reviews: 613,
                        location: "HSR, Bengaluru",
                        image: 'assets/eeva_spa_logo.png',
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  // Reusable dropdown-style button
  Widget _dropdownButton({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Colors.black),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
