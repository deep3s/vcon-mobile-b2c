import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_time_app/landing_page/tag_scroller.dart';

class Vcut extends StatefulWidget {
  const Vcut({super.key});

  @override
  State<Vcut> createState() => _VcutState();
}

class _VcutState extends State<Vcut> {
  final List<String> _tags = [
    'Featured',
    'Massage',
    'Therapy',
    'Wellness',
  ];

  String _selectedTag = 'Featured';
  bool _showAllFeatured = false;

  final Map<String, List<Map<String, String>>> _tagToServices = {
    'Featured': [
      {'title': 'Female to Male Massage', 'duration': '30 mins', 'price': '₹2,010'},
      {'title': 'Swedish Massage', 'duration': '30 mins', 'price': '₹1,500'},
      {'title': 'Reflexology', 'duration': '30 mins', 'price': '₹1,000'},
      {'title': 'Aromatherapy Massage', 'duration': '45 mins', 'price': '₹2,200'},
    ],
    'Massage': [
      {'title': 'Deep Tissue Massage', 'duration': '30 mins', 'price': '₹1,500'},
      {'title': 'Therapeutic Massage', 'duration': '30 mins', 'price': '₹1,500'},
    ],
    'Therapy': [
      {'title': 'Hot Stone Therapy', 'duration': '1 hr', 'price': '₹2,400'},
    ],
    'Wellness': [
      {'title': 'Herbal Spa', 'duration': '1 hr 30 mins', 'price': '₹3,000'},
    ],
  };

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final allServices = _tagToServices[_selectedTag] ?? [];
    final services = (_selectedTag == 'Featured' && !_showAllFeatured)
        ? allServices.take(5).toList()
        : allServices;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 🔺 Header image + buttons
            Stack(
              children: [
                Image.asset(
                  'assets/location1.jpg',
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 60,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() => isFavorite = !isFavorite);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(isFavorite
                                ? 'Added to favorites'
                                : 'Removed from favorites'),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.share, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),

            // 🔻 Scroll content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'V-Cut Salon',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.black),
                        Text(
                          ' 4.5 ',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Text('(15)', style: GoogleFonts.inter(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'JP Nagar, Bengaluru',
                      style: GoogleFonts.inter(color: Colors.grey.shade700),
                    ),
                    Text(
                      'Open until 11:00 PM',
                      style: GoogleFonts.inter(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 12),

                    // 🔻 Tag filter
                    TagScroller(
                      tags: _tags,
                      selectedTag: _selectedTag,
                      onTagSelected: (tag) {
                        setState(() {
                          _selectedTag = tag;
                          _showAllFeatured = false;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    const Divider(),

                    // 🔻 Services list
                    ...services.map((service) => _serviceCard(
                      title: service['title']!,
                      duration: service['duration']!,
                      price: service['price']!,
                      onTap: () {},
                    )),

                    const SizedBox(height: 20),
                    if (_selectedTag == 'Featured' && !_showAllFeatured)
                      Center(
                        child: TextButton(
                          onPressed: () {
                            setState(() => _showAllFeatured = true);
                          },
                          child: Text(
                            'See all',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 24),

                    // 🔻 About Section
                    Text(
                      'About',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.info_outline, size: 20, color: Colors.black),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'V-Cut Salon in JP Nagar offers a variety of relaxing and rejuvenating services. Our skilled professionals ensure a premium experience in a clean and welcoming environment.',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.grey.shade800,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),

// 🔻 Reviews Section
                    Text(
                      'Reviews',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Column(
                      children: [
                        _reviewCard(
                          username: 'Amit S.',
                          rating: 5,
                          comment: 'Great ambience and very professional staff. Will visit again!',
                        ),
                        const SizedBox(height: 12),
                        _reviewCard(
                          username: 'Priya M.',
                          rating: 4,
                          comment: 'Loved the massage. Booking was easy and quick.',
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                  ],
                ),
              ),
            ),

            // 🔻 Bottom bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${services.length} services available',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Book now',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _serviceCard({
    required String title,
    required String duration,
    required String price,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(duration,
                    style: GoogleFonts.inter(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 4),
                Text('from $price',
                    style: GoogleFonts.inter(
                        fontSize: 13, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade100,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: const Text('Book'),
          ),
        ],
      ),
    );
  }

  Widget _reviewCard({
    required String username,
    required int rating,
    required String comment,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person, size: 18, color: Colors.black),
              const SizedBox(width: 8),
              Text(
                username,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              Row(
                children: List.generate(
                  5,
                      (index) => Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    size: 16,
                    color: Colors.amber,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            comment,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: Colors.grey.shade800,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
