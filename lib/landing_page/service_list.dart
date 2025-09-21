import 'package:flutter/material.dart';

class ServiceList extends StatelessWidget {
  final List<Map<String, String>> services;
  final bool showAll;
  final VoidCallback onSeeAll;
  final ThemeData theme;

  const ServiceList({
    super.key,
    required this.services,
    required this.showAll,
    required this.onSeeAll,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final displayed = showAll ? services : services.take(4).toList();
    final shouldShowSeeAll = services.length > 4 && !showAll;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: displayed.length + (shouldShowSeeAll ? 1 : 0),
      itemBuilder: (_, index) {
        if (index == 4 && shouldShowSeeAll) {
          return TextButton(
            onPressed: onSeeAll,
            child: Text(
              'See all ${services.length} services',
              style: textTheme.bodyMedium?.copyWith(color: colorScheme.primary),
            ),
          );
        }

        final service = displayed[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(service['title']!, style: textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(service['duration']!, style: textTheme.bodySmall),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: colorScheme.primary),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                ),
                child: Text('Book', style: textTheme.labelLarge?.copyWith(color: colorScheme.primary)),
              ),
            ],
          ),
        );
      },
    );
  }
}
