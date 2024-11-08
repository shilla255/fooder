import 'package:flutter/material.dart';
import 'package:fooder/presentation/view/user_auth_view/auth_screen/signin_signup_screen.dart';
import 'package:fooder/presentation/view/home_view/home_screen.dart';
import 'package:fooder/presentation/view/search_screen_view/search_screens/search_screen.dart';
import 'package:fooder/presentation/view/favorite_screen_view/favorite_screen.dart';
import 'package:fooder/presentation/view/profile_screen_view/profile_screen.dart'; // Import ProfileScreen

import '../presentation/view/cart_page/cart_screen.dart';

class AppRoutes {
  static const String authPage = '/auth';
  static const String homePage = '/home';
  static const String searchPage = '/search';
  static const String favouritePage = '/favourite';
  static const String cartPage = '/cart';
  static const String profilePage = '/profile'; // Add profilePage route

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authPage:
        return MaterialPageRoute(builder: (_) => const AuthToggleForm());
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case searchPage:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case favouritePage:
        return MaterialPageRoute(builder: (_) => const FavouriteScreen());
      case cartPage:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case profilePage:
        return MaterialPageRoute(builder: (_) => const ProfileScreen()); // Add ProfileScreen route
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}