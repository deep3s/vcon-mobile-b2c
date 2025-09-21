import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'landing_page/tag_scroller.dart';

class VcutYelahanka extends StatefulWidget {
  const VcutYelahanka({super.key});

  @override
  State<VcutYelahanka> createState() => _VcutYelahankaState();
}

class _VcutYelahankaState extends State<VcutYelahanka> {
  String _selectedTag = 'Featured';
  bool _showAllServices = false;

  final List<String> _tagList = [
    'Featured',
    'Combos',
    'Hair Cut',
    'Waxing',
    'Facials',
  ];

  final _tagToServices = {
    'Featured': [
      {'title': 'Any 1 Threading', 'duration': '10 mins', 'price': '₹79.20'},
      {'title': 'Hair Cut', 'duration': '30–40 mins', 'price': '₹319.20'},
      {'title': 'Detan Pack - Face & Neck', 'duration': '25 mins', 'price': '₹199.00'},
      {'title': 'Hair Spa', 'duration': '30 mins', 'price': '₹499.00'},
      {'title': 'Eyebrow Threading', 'duration': '10 mins', 'price': '₹49.00'},
    ],
    'Combos': [
      {'title': 'Facial + Hair Spa Combo', 'duration': '1h 30m', 'price': '₹1,199.00'},
    ],
    'Hair Cut': [
      {'title': 'Advanced Hair Cut', 'duration': '45 mins', 'price': '₹449.00'},
    ],
    'Waxing': [
      {'title': 'Under Arms Waxing', 'duration': '15 mins', 'price': '₹129.00'},
    ],
    'Facials': [
      {'title': 'Fruit Facial', 'duration': '45 mins', 'price': '₹499.00'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final allServices = _tagToServices[_selectedTag] ?? [];
    final visibleServices = _showAllServices || allServices.length <= 4
        ? allServices
        : allServices.sublist(0, 4);

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 12),
            Stack(
              children: [
                _roundedImage('assets/location4.jpg'),
                Positioned(
                  top: 12,
                  left: 0,
                  right: 0,
                  child: _topIcons(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _salonDetails(textTheme, colorScheme),
            const SizedBox(height: 16),
            TagScroller(
              tags: _tagList,
              selectedTag: _selectedTag,
              onTagSelected: (tag) {
                setState(() {
                  _selectedTag = tag;
                  _showAllServices = false;
                });
              },
            ),
            const SizedBox(height: 12),
            ...visibleServices.map((s) => _serviceCard(s, colorScheme, textTheme)),
            if (!_showAllServices && allServices.length > 4)
              _seeAllButton(colorScheme, textTheme),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.secondary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text('Book now', style: textTheme.titleMedium!.copyWith(color: Colors.black)),
        ),
      ),
    );
  }

  Widget _roundedImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(path, height: 200, width: double.infinity, fit: BoxFit.cover),
    );
  }

  Widget _topIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _circleIcon(Icons.arrow_back, () => Navigator.pop(context)),
        Row(
          children: [
            _circleIcon(Icons.favorite_border, () {}),
            const SizedBox(width: 8),
            _circleIcon(Icons.share, () {}),
          ],
        ),
      ],
    );
  }

  Widget _circleIcon(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }

  Widget _salonDetails(TextTheme textTheme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('V-Cut Unisex Salon Yelahanka',
            style: textTheme.titleLarge!.copyWith(color: colorScheme.secondary)),
        const SizedBox(height: 6),
        Row(
          children: [
            Icon(Icons.star, color: colorScheme.secondary, size: 16),
            const SizedBox(width: 4),
            Text('4.7 (3)', style: textTheme.bodySmall),
          ],
        ),
        const SizedBox(height: 4),
        Text('Yelahanka, Bengaluru\nOpen until 9:00 pm',
            style: textTheme.bodySmall),
      ],
    );
  }

  Widget _serviceCard(Map<String, String> s, ColorScheme colorScheme, TextTheme textTheme) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(s['title'] ?? '',
                      style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 4),
                  Text(s['duration'] ?? '', style: textTheme.bodySmall!.copyWith(color: colorScheme.primary)),
                  const SizedBox(height: 4),
                  Text('from ${s['price']}',
                      style: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.primary, fontWeight: FontWeight.w600)),
                ]),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text('Book',
                    style: textTheme.labelLarge!.copyWith(color: Colors.black)),
              ),
            ],
          ),
        ),
        Divider(thickness: 1, color: Colors.white.withOpacity(0.08)),
      ],
    );
  }

  Widget _seeAllButton(ColorScheme colorScheme, TextTheme textTheme) {
    return Center(
      child: TextButton(
        onPressed: () => setState(() => _showAllServices = true),
        child: Text('See all',
            style: textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.w500, color: colorScheme.secondary)),
      ),
    );
  }
}
