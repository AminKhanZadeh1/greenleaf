import 'package:greenleaf/Features/Cart/Domain/Entity/cart_product.dart';

abstract class CartRepo {
  Future<void> removeFromCart({required String plantId});

  Future<void> saveCartList();

  Future<void> addToCart();

  Future<List<CartProduct>> getCartItems();
}
