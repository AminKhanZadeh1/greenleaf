import 'package:greenleaf/Features/Cart/Data/Source/Local/cart_local_source.dart';

import '../../Domain/Entity/cart_product.dart';

class CartRepoImpl {
  final CartLocalSource _localSource;

  CartRepoImpl(this._localSource);
  @override
  Future<void> addToCart() {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<List<CartProduct>> getCartItems() {
    // TODO: implement getCartItems
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromCart() {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }

  @override
  Future<void> saveCartList() {
    // TODO: implement saveCartList
    throw UnimplementedError();
  }
}
