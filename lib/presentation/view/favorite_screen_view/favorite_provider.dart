import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'favorite_model.dart';


// Update the FavouriteNotifier class in `lib/presentation/view/favorite_screen_view/favorite_provider.dart`

class FavouriteNotifier extends StateNotifier<List<FavouriteItem>> {
  FavouriteNotifier() : super([]);

  String _currentCategory = '';

  String get currentCategory => _currentCategory;

  void addFavourite(FavouriteItem item) {
    if (!state.contains(item)) {
      state = [...state, item];
    }
  }

  void removeFavourite(FavouriteItem item) {
    state = state.where((i) => i != item).toList();
  }

  void filterByCategory(String category) {
    _currentCategory = category;
    state = state.where((item) => item.category == category).toList();
  }
}

final favouriteProvider = StateNotifierProvider<FavouriteNotifier, List<FavouriteItem>>((ref) {
  return FavouriteNotifier();
});