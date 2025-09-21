import 'package:flutter/material.dart';
import 'landing_page/tag_scroller.dart';
import 'landing_page/service_list.dart';

class Vcut extends StatefulWidget {
  const Vcut({super.key});

  @override
  State<Vcut> createState() => _VcutState();
}

class _VcutState extends State<Vcut> {
  final List<String> imageUrls = [
    'https://images.fresha.com/locations/location-profile-images/437841/1995450/2d8a39d4-2c1b-4109-a46a-e39681dfbdb1-Blown-Indiranagar-IN-Karnataka-Bangalore-Indiranagar-Fresha.jpg',
    'https://img.freepik.com/free-photo/interior-hair-salon-with-chairs-equipment_23-2149449517.jpg',
    'https://img.freepik.com/free-photo/beauty-salon-interior-design-modern-style_23-2149334953.jpg',
    'https://img.freepik.com/free-photo/beauty-studio-makeup-hairdressing-interior_23-2149368754.jpg',
    'https://img.freepik.com/free-photo/luxury-hairdresser-salon-interior_23-2149269154.jpg',
  ];

  static const List<Map<String, String>> featuredServices = [
    {'title': 'Any 1 Threading', 'duration': '10 mins', 'price': '100'},
    {'title': 'Haircut', 'duration': '30 mins', 'price': '250'},
    {'title': 'Hair Spa', 'duration': '45 mins', 'price': '500'},
    {'title': 'Full Face Wax', 'duration': '20 mins', 'price': '300'},
    {'title': 'Hair Color Highlights', 'duration': '60 mins', 'price': '1000'},
    {'title': 'Manicure', 'duration': '25 mins', 'price': '400'},
  ];

  static const List<Map<String, String>> buy1get1Services = [
    {'title': 'Facial Cleanup', 'duration': '25 mins', 'price': '300'},
    {'title': 'Bleach + Facial Combo', 'duration': '60 mins', 'price': '650'},
    {'title': 'Head Massage', 'duration': '20 mins', 'price': '200'},
    {'title': 'Hand Polish', 'duration': '15 mins', 'price': '250'},
    {'title': 'Neck & Shoulder Massage', 'duration': '25 mins', 'price': '280'},
  ];

  static const List<Map<String, String>> payLessServices = [
    {'title': 'Full Face Threading', 'duration': '20 mins', 'price': '200'},
    {'title': 'Hair Wash + Conditioning', 'duration': '15 mins', 'price': '150'},
    {'title': 'Neck & Shoulder Massage', 'duration': '20 mins', 'price': '250'},
    {'title': 'Foot Massage', 'duration': '30 mins', 'price': '300'},
    {'title': 'Express Facial', 'duration': '25 mins', 'price': '350'},
    {'title': 'Underarm Wax', 'duration': '10 mins', 'price': '150'},
  ];

  final Map<String, List<Map<String, String>>> filteredServices = {
    'Featured': featuredServices,
    'Buy 1 Get 1 FREE': buy1get1Services,
    'Choose Any 4 & Pay Less': payLessServices,
  };

  final List<String> serviceFilters = [
    'Featured',
    'Buy 1 Get 1 FREE',
    'Choose Any 4 & Pay Less',
  ];

  String selectedFilter = 'Featured';
  bool showAllServices = false;
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onFilterSelected(String filter) {
    setState(() {
      selectedFilter = filter;
      showAllServices = false;
    });
  }

  Widget _buildBadge(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text,
          style: TextStyle(
              color: textColor, fontSize: 12, fontWeight: FontWeight.w500)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final allServices = filteredServices[selectedFilter]!;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.background,
        foregroundColor: colorScheme.onBackground,
        elevation: 0.5,
        title: Text("V-Cut Salon", style: textTheme.titleLarge),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 🔹 Image Carousel
          Stack(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: imageUrls.length,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  itemBuilder: (_, index) {
                    return Image.network(imageUrls[index], fit: BoxFit.cover);
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${_currentPage + 1}/${imageUrls.length}',
                    style: textTheme.bodySmall?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

          // 🔹 Salon Info
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Getlook Unisex Salon HSR Layout Sector 6', style: textTheme.titleLarge),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber.shade600, size: 20),
                    const SizedBox(width: 4),
                    Text('4.7', style: textTheme.bodyMedium),
                    const SizedBox(width: 4),
                    Text('(3)', style: textTheme.bodySmall?.copyWith(color: colorScheme.primary)),
                  ],
                ),
                const SizedBox(height: 4),
                Text('Bengaluru, Bengaluru', style: textTheme.bodySmall),
                const SizedBox(height: 2),
                Text('Open until 9:00 pm', style: textTheme.bodySmall?.copyWith(color: Colors.green)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _buildBadge('Featured', colorScheme.primaryContainer, colorScheme.onPrimaryContainer),
                    const SizedBox(width: 8),
                    _buildBadge('Deals', Colors.green.shade100, Colors.green.shade800),
                  ],
                ),
              ],
            ),
          ),

          // 🔹 Tag Scroller
          TagScroller(
            tags: serviceFilters,
            selectedTag: selectedFilter,
            onTagSelected: onFilterSelected,
          ),

          const SizedBox(height: 16),

          // 🔹 Services List Component
          Expanded(
            child: SingleChildScrollView(
              child: ServiceList(
                services: allServices,
                showAll: showAllServices,
                onSeeAll: () => setState(() => showAllServices = true),
                theme: theme,
              ),
            ),
          ),

          // 🔹 Bottom booking bar
          Container(
            color: colorScheme.surface,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${allServices.length} services available', style: textTheme.bodyMedium),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Book now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
