import 'package:greenleaf/Features/Cart/Data/Source/Local/cart_local_source.dart';
import 'package:greenleaf/Features/Cart/Domain/Repository/cart_repo.dart';

import '../../Domain/Entity/cart_product.dart';

class CartRepoImpl implements CartRepo {
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
  Future<void> saveCartList() {
    // TODO: implement saveCartList
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromCart({required String plantId}) async {
    return await _localSource.removeFromCart(plantId);
  }
}
