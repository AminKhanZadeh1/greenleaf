import 'package:greenleaf/Features/Cart/Data/Models/cart_product_model.dart';
import 'package:greenleaf/Features/Cart/Data/Source/Local/cart_local_source.dart';
import 'package:greenleaf/Features/Cart/Domain/Repository/cart_repo.dart';

import '../../Domain/Entity/cart_product.dart';

class CartRepoImpl implements CartRepo {
  final CartLocalSource _localSource;

  CartRepoImpl(this._localSource);

  @override
  Future<List<CartProduct>> getCartItems() async {
    final productsList = await _localSource.getCartItems();
    return productsList.map((item) => item.toEntity()).toList();
  }

  @override
  Future<void> addToCart({required CartProduct entity}) async {
    final model = CartProductModel.fromEntity(entity);
    return await _localSource.addToCart(model);
  }

  @override
  Future<void> removeFromCart({required String plantId}) {
    return _localSource.decreaseCartItem(plantId);
  }
}
