import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../main.dart';
import 'home_widgets/appbar_widget.dart';
import 'home_widgets/category_widget.dart';
import 'home_widgets/dish_card/mock_dish_data.dart';
import 'home_widgets/searchbar_widget.dart';
import 'home_screen/restaurant/mock_restaurant_data.dart';
import 'home_screen/restaurant/restaurant_card_widget.dart';
import 'home_widgets/dish_card/dish_card_widget.dart';
import 'package:fooder/presentation/widgets/reusable_widget/bottom_nav_bar.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _handleThemeSwitch(WidgetRef ref) {
    ref.read(themeProvider.notifier).toggleTheme();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: EnhancedAppBar(onThemeSwitch: () => _handleThemeSwitch(ref)),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 0),
              SearchBarWidget(onFilterPressed: () {
                // Handle filter logic
              }),
              const SizedBox(height: 8), // Small height
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'categories'.tr(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const CategoriesWidget(),
              const SizedBox(height: 12), // Small height
              Container(
                height: 50, // Small height for the TabBar
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12), // Rounded edges for stylish look
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3), // Shadow for effect
                    ),
                  ],
                ),
                child: TabBar(
                  indicatorColor: Theme.of(context).primaryColor,
                  indicatorWeight: 3,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(icon: const Icon(Icons.restaurant), text: "restaurants".tr()),
                    Tab(icon: const Icon(Icons.hotel), text: "hotels".tr()),
                    Tab(icon: const Icon(Icons.person), text: "chefs".tr()),
                  ],
                ),
              ),
              const SizedBox(height: 8), // Small height
              SizedBox(
                height: 250, // Adjust height as needed
                child: TabBarView(
                  children: [
                    // Restaurants tab content
                    ListView.builder(
                      scrollDirection: Axis.horizontal, // Scroll horizontally
                      itemCount: mockRestaurants.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: RestaurantHomeCard(restaurant: mockRestaurants[index]),
                        );
                      },
                    ),
                    // Hotels tab content
                    Center(child: Text("hotels".tr())), // Use localization for "Hotels"
                    // Chefs tab content
                    Center(child: Text("chefs".tr())),  // Use localization for "Chefs"
                  ],
                ),
              ),
              const SizedBox(height: 8), // Small height
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(height: 4), // Very small height
              SizedBox(
                height: 300, // Adjust height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mockDishes.length,
                  itemBuilder: (context, index) {
                    return DishCard(
                      dish: mockDishes[index],
                      onAddToCart: (dish) {
                        // Handle add to cart logic
                      },
                      onToggleFavorite: (dish) {
                        // Handle toggle favorite logic
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: StylishBottomNavBar(
          selectedIndex: 0,
          onItemSelected: (index) {
            // Handle navigation logic
          },
        ),
      ),
    );
  }
}