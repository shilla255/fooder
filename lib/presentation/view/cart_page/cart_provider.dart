import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_model.dart';


class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addItem(CartItem item) {
    state = [...state, item];
  }

  void removeItem(String id) {
    state = state.where((item) => item.id != id).toList();
  }

  void updateQuantity(String id, int quantity) {
    state = state.map((item) {
      if (item.id == id) {
        return CartItem(
          id: item.id,
          name: item.name,
          price: item.price,
          quantity: quantity, imageUrl: '',
        );
      }
      return item;
    }).toList();
  }

  double get totalPrice {
    return state.fold(0, (total, item) => total + item.price * item.quantity);
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});