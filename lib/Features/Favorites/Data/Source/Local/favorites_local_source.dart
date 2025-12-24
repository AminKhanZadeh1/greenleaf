import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FavoritesLocalSource {
  final SharedPreferences _preferences;

  const FavoritesLocalSource(this._preferences);

  Future<List<String>> getFavItems() async {
    final jsonString = _preferences.getString("favorites");
    if (jsonString == null) return [];
    print("Json 6 ::: $jsonString");
    final cartItems = (jsonDecode(jsonString) as List<dynamic>)
        .map((item) => item.toString())
        .toList();

    return cartItems;
  }

  Future<void> saveFavsList(List<String> items) async {
    await _preferences.setString('favorites', items.toString());
  }

  Future<void> addToFavs(String id) async {
    final cart = await getFavItems();

    final index = cart.indexWhere((p) => p == id);

    if (index == -1) {
      cart.add(id);
    }
    await saveFavsList(cart);
  }

  Future<void> removeFromFavs(String id) async {
    final cart = await getFavItems();
    for (String itemId in cart) {
      print("Json 7 ::: $itemId");
    }
    cart.removeWhere((p) => p == id);
    await saveFavsList(cart);
  }
}
