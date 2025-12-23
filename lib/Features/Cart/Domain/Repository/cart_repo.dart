import 'package:greenleaf/Features/Cart/Domain/Entity/cart_product.dart';

abstract class CartRepo {
  Future<List<CartProduct>> getCartItems();

  Future<void> addToCart({required CartProduct entity});

  Future<void> removeFromCart({required String plantId});
}
