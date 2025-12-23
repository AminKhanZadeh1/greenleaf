import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/cart_product_model.dart';

class CartLocalSource {
  final SharedPreferences _preferences;

  const CartLocalSource(this._preferences);

  Future<void> removeFromCart(String plantId) async {
    final cart = await getCartItems();
    cart.removeWhere((plant) => plant.id == plantId);
    await saveCartList(cart);
  }

  Future<void> saveCartList(List<CartProductModel> plants) async {
    final jsonList = plants.map((p) => p.toJson()).toList();
    await _preferences.setString('plants', jsonEncode(jsonList));
  }

  Future<void> addToCart(CartProductModel product) async {
    final cart = await getCartItems();
    final index = cart.indexWhere((p) => p.id == product.id);

    if (index != -1) {
      cart[index].quantity += 1;
    } else {
      product.quantity = 1;
      cart.add(product);
    }

    await saveCartList(cart);
  }

  Future<List<CartProductModel>> getCartItems() async {
    final jsonString = _preferences.getString("plants");
    if (jsonString == null) return [];

    final cartItems = (jsonDecode(jsonString) as List<dynamic>)
        .map((item) => CartProductModel.fromJson(item as Map<String, dynamic>))
        .toList();

    return cartItems;
  }

  Future<void> decreaseCartItem(String plantId) async {
    final cart = await getCartItems();
    final index = cart.indexWhere((p) => p.id == plantId);

    if (index != -1) {
      cart[index].quantity -= 1;

      if (cart[index].quantity <= 0) {
        cart.removeAt(index);
      }

      await saveCartList(cart);
    }
  }
}
