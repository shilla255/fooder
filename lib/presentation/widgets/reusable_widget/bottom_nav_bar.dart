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

class _StylishBottomNavBarState extends State<StylishBottomNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  final List<IconData> _icons = [
    CupertinoIcons.house_fill,
    CupertinoIcons.search,
    CupertinoIcons.heart_fill,
    CupertinoIcons.cart_fill,
    CupertinoIcons.person_fill,
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
      duration: const Duration(milliseconds: 400),
    );
    _animations = List.generate(
      5,
          (index) => Tween<double>(begin: 0.8, end: 1.2).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.1,
            (index + 1) * 0.1,
            curve: Curves.elasticOut,
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
      height: 75,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: -5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (index) => _buildNavItem(index)),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    bool isSelected = widget.selectedIndex == index;
    Color itemColor = isSelected
        ? Theme.of(context).primaryColor
        : Colors.grey.shade600;

    return GestureDetector(
      onTap: () {
        widget.onItemSelected(index);
        _controller.forward(from: 0);
        _navigateToPage(index);
      },
      child: Container(
        width: 65,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScaleTransition(
              scale: _animations[index],
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (isSelected)
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  Icon(
                    _icons[index],
                    color: itemColor,
                    size: 24,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: itemColor,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              child: Text(_labels[index]),
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
        route = AppRoutes.profilePage;
        break;
      default:
        route = AppRoutes.homePage;
    }
    Navigator.pushNamed(context, route);
  }
}