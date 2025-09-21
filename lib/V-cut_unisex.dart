import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VcutUnisexHulimavu extends StatefulWidget {
  const VcutUnisexHulimavu({super.key});

  @override
  State<VcutUnisexHulimavu> createState() => _VcutUnisexHulimavuState();
}

class _VcutUnisexHulimavuState extends State<VcutUnisexHulimavu> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> services = const [
    {'name': 'Any 1 Threading', 'duration': '10 mins', 'price': '₹79.20'},
    {'name': 'Hair Cut', 'duration': '30-40 mins', 'price': '₹319.20'},
    {'name': 'Hair Treatments', 'duration': '3 hrs', 'price': '₹4,999'},
    {'name': 'Brazilian Wax', 'duration': '10-30 mins', 'price': '₹119.20'},
  ];

  final List<Map<String, String>> reviews = const [
    {
      'name': 'Neha Sharma',
      'rating': '5',
      'comment': 'Amazing service! The staff was friendly and professional.',
      'date': '28 July 2025'
    },
    {
      'name': 'Ravi Kumar',
      'rating': '4',
      'comment': 'Haircut was neat and clean. Ambience was good.',
      'date': '25 July 2025'
    },
    {
      'name': 'Ayesha',
      'rating': '5',
      'comment': 'Loved the waxing service. Very hygienic and quick!',
      'date': '20 July 2025'
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildServiceTab() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: services.length,
      separatorBuilder: (_, __) => Divider(height: 32, color: Theme.of(context).dividerColor),
      itemBuilder: (context, index) {
        final service = services[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    service['name']!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    side: BorderSide(color: Theme.of(context).colorScheme.primary),
                  ),
                  child: Text("Book", style: Theme.of(context).textTheme.labelLarge),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              service['duration']!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                "from ${service['price']!}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildReviewTab() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: reviews.length,
      separatorBuilder: (_, __) => Divider(height: 24, color: Theme.of(context).dividerColor),
      itemBuilder: (context, index) {
        final review = reviews[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_circle, size: 32, color: Theme.of(context).colorScheme.onSurfaceVariant),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review['name']!, style: Theme.of(context).textTheme.titleSmall),
                    Text(
                      review['date']!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(
                5,
                    (i) => Icon(
                  i < int.parse(review['rating']!) ? Icons.star : Icons.star_border,
                  size: 18,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(review['comment']!, style: Theme.of(context).textTheme.bodyMedium),
          ],
        );
      },
    );
  }

  Widget _buildAboutTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text("About Us", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            "V-Cut Unisex Salon in Hulimavu offers premium services in hair, skin, and wellness with a customer-first approach.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Text("Opening Hours",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("Mon–Sun: 10 AM – 8 PM", style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 16),
          Text("Additional Information",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            "Walk-ins welcome • Online bookings available • Unisex services",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'V-Cut Unisex Salon HSR',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        leading: const BackButton(),
        actions: const [
          Icon(Icons.share_outlined),
          SizedBox(width: 16),
          Icon(Icons.favorite_border),
          SizedBox(width: 16),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: colorScheme.primary,
          labelColor: colorScheme.onSurface,
          unselectedLabelColor: colorScheme.onSurfaceVariant,
          labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500),
          tabs: const [
            Tab(text: "Services"),
            Tab(text: "Reviews"),
            Tab(text: "About"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildServiceTab(),
          _buildReviewTab(),
          _buildAboutTab(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Text("182 services available",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[700])),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text("Book now", style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
