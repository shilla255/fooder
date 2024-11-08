import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../widgets/reusable_widget/bottom_nav_bar.dart';
import '../../home_view/home_widgets/searchbar_widget.dart';
import 'dropdown/category_based_list.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Empty white app bar
        elevation: 0, // No shadow
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              text: TextSpan(
                text: 'Search: ',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Choose Category',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Add the SearchBarWidget below the header
          SearchBarWidget(
            onFilterPressed: () {
              // Handle filter logic here
            },
          ),
          const SizedBox(height: 16), // Add some spacing before the list
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CategoryBasedList(), // The list widget based on selected category
            ),
          ),
        ],
      ),
      bottomNavigationBar: StylishBottomNavBar(
        selectedIndex: 1, // Set the selected index to 1 for the search screen
        onItemSelected: (index) {
          // Handle navigation logic
        },
      ),
    );
  }
}