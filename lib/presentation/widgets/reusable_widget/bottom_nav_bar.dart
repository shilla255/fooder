import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fooder/routes/app_routes.dart';

class StylishBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const StylishBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  _StylishBottomNavBarState createState() => _StylishBottomNavBarState();
}

class _StylishBottomNavBarState extends State<StylishBottomNavBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  final List<IconData> _icons = [
    CupertinoIcons.home,
    CupertinoIcons.search,
    CupertinoIcons.heart,
    CupertinoIcons.cart,
    CupertinoIcons.person,
  ];

  final List<String> _labels = [
    'Home',
    'Search',
    'Favourites',
    'Cart',
    'Profile',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animations = List.generate(
      5,
      (index) => Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.2,
            (index + 1) * 0.2,
            curve: Curves.easeInOut,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) => _buildNavItem(index)),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    bool isSelected = widget.selectedIndex == index;
    Color itemColor = isSelected ? Colors.black : Colors.grey;

    return GestureDetector(
      onTap: () {
        widget.onItemSelected(index);
        if (isSelected) {
          _controller.forward(from: 0);
        }
        _navigateToPage(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            ScaleTransition(
              scale: _animations[index],
              child: Icon(_icons[index], color: itemColor),
            ),
            if (isSelected)
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  color: itemColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                child: Text(' ${_labels[index]}'),
              ),
          ],
        ),
      ),
    );
  }

  void _navigateToPage(int index) {
    String route;
    switch (index) {
      case 0:
        route = AppRoutes.homePage;
        break;
      case 1:
        route = AppRoutes.searchPage;
        break;
      case 2:
        route = AppRoutes.favouritePage;
        break;
      case 3:
        route = AppRoutes.cartPage;
        break;
      case 4:
        route = AppRoutes.profilePage; // Ensure correct route for profile
        break;
      default:
        route = AppRoutes.homePage;
    }
    Navigator.pushNamed(context, route);
  }
}