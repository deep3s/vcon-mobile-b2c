import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_time_app/landing_page/tag_scroller.dart';

class VCutHSR extends StatefulWidget {
  const VCutHSR({super.key});

  @override
  State<VCutHSR> createState() => _VCutHSRState();
}

class NearbyVenue {
  final String name;
  final double? rating;
  final int? reviewCount;
  final String category;
  final String distance;
  final String? imageUrl;

  NearbyVenue({
    required this.name,
    this.rating,
    this.reviewCount,
    required this.category,
    required this.distance,
    this.imageUrl,
  });
}

class _VCutHSRState extends State<VCutHSR> {
  final List<String> _tags = [
    'Featured',
    'Buy 1 Get 1 FREE',
    'Choose Any 4 & Pay Less',
    'Hair Treatment',
    'Hair Cut',
    'Waxing',
  ];

  String _selectedTag = 'Featured';
  bool _showAllFeatured = false;

  final Map<String, List<Map<String, String>>> _tagToServices = {
    'Featured': [
      {'title': 'Any 1 Threading', 'duration': '10 mins', 'price': '₹79.20'},
      {'title': 'Hair Cut', 'duration': '30–40 mins', 'price': '₹319.20'},
      {'title': 'Detan Pack - Face & Neck', 'duration': '25 mins', 'price': '₹199.00'},
      {'title': 'Upper Lip + Eyebrow Threading', 'duration': '15 mins', 'price': '₹99.00'},
      {'title': 'Under Arms Waxing', 'duration': '10 mins', 'price': '₹149.00'},
      {'title': 'Pedicure + Manicure Combo', 'duration': '1h 10m', 'price': '₹599.00'},
    ],
    'Buy 1 Get 1 FREE': [
      {'title': 'Facial + Cleanup Combo', 'duration': '1 hr', 'price': '₹999.00'},
      {'title': 'Full Arms Wax + Underarms Wax', 'duration': '45 mins', 'price': '₹299.00'},
      {'title': 'Head Massage + Hair Wash', 'duration': '30 mins', 'price': '₹199.00'},
      {'title': 'Brazilian Wax', 'duration': '10–30 mins', 'price': '₹119.20'},
    ],
    'Choose Any 4 & Pay Less': [
      {'title': 'Threading Combo', 'duration': '30 mins', 'price': '₹199.00'},
      {'title': 'Waxing Combo', 'duration': '1h 15m', 'price': '₹699.00'},
      {'title': 'Glow Pack', 'duration': '1h 30m', 'price': '₹1,299.00'},
      {'title': 'Hair Treatments', 'duration': '3 hrs', 'price': '₹4,999'},
    ],
    'Hair Treatment': [
      {'title': 'Hair Spa & Smoothening', 'duration': '1 hr', 'price': '₹999.00'},
      {'title': 'Anti-Dandruff Hair Spa', 'duration': '45 mins', 'price': '₹799.00'},
      {'title': 'Keratin Treatment', 'duration': '2.5 hrs', 'price': '₹2,999.00'},
      {'title': 'Hair Fall Control Therapy', 'duration': '1.5 hrs', 'price': '₹1,499.00'},
    ],
    'Hair Cut': [
      {'title': 'Hair Cut', 'duration': '30–40 mins', 'price': '₹319.20'},
      {'title': 'Women Hair Cut', 'duration': '45 mins', 'price': '₹399.00'},
    ],
    'Waxing': [
      {'title': 'Under Arms Waxing', 'duration': '10 mins', 'price': '₹149.00'},
      {'title': 'Full Body Wax', 'duration': '1 hr', 'price': '₹799.00'},
    ],
  };

  final String _staticMapImageUrl = 'https://via.placeholder.com/400x200?text=Map+Here';

  final List<NearbyVenue> _nearbyVenues = [
    NearbyVenue(
      name: 'Looks Salon – HSR',
      rating: 4.5,
      reviewCount: 120,
      category: 'Hair Salon',
      distance: '0.3 km',
      imageUrl: 'https://via.placeholder.com/150/FF5733/FFFFFF?text=Looks',
    ),
    NearbyVenue(
      name: 'Vedica Wellness Center',
      rating: 2.0,
      reviewCount: 1,
      category: 'Therapy',
      distance: 'HSR Layout',
      imageUrl: 'https://via.placeholder.com/150/33FF57/FFFFFF?text=Vedica',
    ),
    NearbyVenue(
      name: 'Hellojin – Bommanahalli',
      rating: 4.8,
      reviewCount: 4,
      category: 'Salon',
      distance: '2.5 km',
      imageUrl: 'https://via.placeholder.com/150/5733FF/FFFFFF?text=Hellojin',
    ),
    NearbyVenue(
      name: 'Green Trends – Koramangala',
      rating: 4.2,
      reviewCount: 85,
      category: 'Unisex Salon',
      distance: '1.1 km',
      imageUrl: 'https://via.placeholder.com/150/FF33CC/FFFFFF?text=Green',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final allServices = _tagToServices[_selectedTag] ?? [];
    final services = (_selectedTag == 'Featured' && !_showAllFeatured)
        ? allServices.take(5).toList()
        : allServices;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            _topImageHeader(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                children: [
                  _titleSection(),
                  const SizedBox(height: 10),
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


                  const SizedBox(height: 16),
                  ...services.map((s) => _serviceCard(
                    title: s['title']!,
                    duration: s['duration']!,
                    price: s['price']!,
                    onTap: () {},
                  )),
                  if (_selectedTag == 'Featured' && !_showAllFeatured)
                    Center(
                      child: TextButton(
                        onPressed: () => setState(() => _showAllFeatured = true),
                        child: const Text('See all'),
                      ),
                    ),
                  const SizedBox(height: 24),
                  _sectionHeader('Reviews'),
                  _reviewCard('Ayesha K.', 5, 'Loved the facial and the ambiance!'),
                  _reviewCard('Ravi S.', 4, 'Haircut was perfect. Staff was polite.'),
                  _reviewCard('Nikita J.', 5, 'Threading was quick and painless.'),
                  const SizedBox(height: 24),
                  _sectionHeader('About'),
                  _aboutText(),
                  const SizedBox(height: 24),
                  _sectionHeader('Opening times'),
                  _buildOpeningTimes(),
                  const SizedBox(height: 24),
                  _sectionHeader('Additional information'),
                  _buildAdditionalInformation(),
                  const SizedBox(height: 24),
                  _sectionHeader('Location'),
                  _mapSection(),
                  const SizedBox(height: 24),
                  _sectionHeader('Venues Nearby'),
                  _nearbyVenueList(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            _bottomBookingBar(services.length),
          ],
        ),
      ),
    );
  }

  Widget _topImageHeader() => Stack(
    children: [
      Image.asset('assets/salon.png', width: double.infinity, height: 230, fit: BoxFit.cover),
      Positioned(
        top: 12,
        left: 12,
        child: _circleButton(Icons.arrow_back, () => Navigator.pop(context)),
      ),
      Positioned(
        top: 12,
        right: 60,
        child: _circleButton(Icons.favorite_border, () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to favorites')));
        }),
      ),
      Positioned(
        top: 12,
        right: 12,
        child: _circleButton(Icons.share, () {}),
      ),
    ],
  );

  Widget _titleSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('V-cut Unisex Salon HSR', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600)),
      const SizedBox(height: 6),
      Row(
        children: [
          const Icon(Icons.star, size: 16),
          const SizedBox(width: 4),
          Text('4.7 (3)', style: GoogleFonts.inter(fontSize: 14)),
        ],
      ),
      Text('Bengaluru, Bengaluru', style: GoogleFonts.inter(color: Colors.grey.shade700)),
      Text('Open until 9:00 pm', style: GoogleFonts.inter(color: Colors.grey.shade700)),
    ],
  );

  Widget _serviceCard({required String title, required String duration, required String price, required VoidCallback onTap}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14)),
            const SizedBox(height: 4),
            Text(duration, style: GoogleFonts.inter(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('From $price', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Book'),
                ),
              ],
            ),
            const Divider(height: 20),
          ],
        ),
      );

  Widget _reviewCard(String user, int rating, String comment) => Container(
    margin: const EdgeInsets.only(bottom: 14),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: List.generate(5, (i) => Icon(i < rating ? Icons.star : Icons.star_border, size: 16, color: Colors.amber))),
        const SizedBox(height: 6),
        Text(user, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        Text(comment, style: GoogleFonts.inter()),
      ],
    ),
  );

  Widget _sectionHeader(String text) => Text(text, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600));

  Widget _aboutText() => Text(
    'GetLook is a premier salon service provider based in Bangalore, offering Hydra Facials, Hair Highlights, Waxing, and more.',
    style: GoogleFonts.inter(color: Colors.grey.shade700),
  );

  Widget _buildOpeningTimes() => Column(children: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'].map((day) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 8, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(child: Text(day, style: GoogleFonts.inter())),
          Text('10:00 am – 9:00 pm', style: GoogleFonts.inter()),
        ],
      ),
    );
  }).toList());

  Widget _buildAdditionalInformation() => Column(children: [
    _infoRow(Icons.check_circle_outline, 'Instant confirmation'),
    _infoRow(Icons.face, 'Kid-friendly'),
    _infoRow(Icons.local_parking, 'Parking available'),
    _infoRow(Icons.eco, 'Organic products only'),
  ]);

  Widget _infoRow(IconData icon, String label) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(children: [Icon(icon, size: 20), const SizedBox(width: 10), Text(label, style: GoogleFonts.inter())]),
  );

  Widget _mapSection() => ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.network(
      _staticMapImageUrl,
      height: 200,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => const Center(child: Text('Map unavailable')),
    ),
  );

  Widget _nearbyVenueList() => SizedBox(
    height: 190,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _nearbyVenues.length,
      itemBuilder: (context, index) {
        final v = _nearbyVenues[index];
        return Container(
          width: 150,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: v.imageUrl != null
                    ? Image.network(
                  v.imageUrl!,
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 100,
                    width: 150,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.broken_image, size: 40),
                  ),
                )
                    : Container(
                  height: 100,
                  width: 150,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image_not_supported, size: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      v.name,
                      style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    if (v.rating != null)
                      Row(
                        children: [
                          const Icon(Icons.star, size: 12, color: Colors.amber),
                          const SizedBox(width: 2),
                          Text('${v.rating}', style: GoogleFonts.inter(fontSize: 11)),
                          if (v.reviewCount != null)
                            Text(' (${v.reviewCount})', style: GoogleFonts.inter(fontSize: 10)),
                        ],
                      ),
                    const SizedBox(height: 2),
                    Text(
                      v.category,
                      style: GoogleFonts.inter(fontSize: 11, color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      v.distance,
                      style: GoogleFonts.inter(fontSize: 10, color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );

  Widget _bottomBookingBar(int count) => Container(
    color: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    child: Row(
      children: [
        Expanded(child: Text('$count services available', style: GoogleFonts.inter(color: Colors.grey.shade700))),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          child: const Text('Book now', style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );

  Widget _circleButton(IconData icon, VoidCallback onTap) => CircleAvatar(
    backgroundColor: Colors.white,
    child: IconButton(icon: Icon(icon, color: Colors.black), onPressed: onTap),
  );
}
