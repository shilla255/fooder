import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooder/presentation/widgets/reusable_widget/bottom_nav_bar.dart';
import 'favorite_card_widget.dart';
import 'favorite_provider.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteItems = ref.watch(favouriteProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Favourites',
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryButton(context, ref, Icons.hotel, 'Hotel', 'hotel'),
                _buildCategoryButton(context, ref, Icons.menu_book, 'Menu', 'menu'),
                _buildCategoryButton(context, ref, Icons.restaurant, 'Restaurant', 'restaurant'),
                _buildCategoryButton(context, ref, Icons.person, 'Chef', 'chef'),
              ],
            ),
          ),
          Expanded(
            child: favouriteItems.isEmpty
                ? Center(
                    child: Text(
                      'No favourites yet!',
                      style: theme.textTheme.titleMedium,
                    ),
                  )
                : ListView.builder(
                    itemCount: favouriteItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: FavouriteCardWidget(item: favouriteItems[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: StylishBottomNavBar(
        selectedIndex: 2,
        onItemSelected: (index) {
          // Handle navigation logic here if needed
        },
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, WidgetRef ref, IconData icon, String label, String category) {
    final theme = Theme.of(context);
    final isSelected = ref.watch(favouriteProvider.notifier).currentCategory == category;

    return InkWell(
      onTap: () => ref.read(favouriteProvider.notifier).filterByCategory(category),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? theme.colorScheme.primary : theme.iconTheme.color,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: isSelected ? theme.colorScheme.primary : theme.textTheme.bodySmall?.color,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}