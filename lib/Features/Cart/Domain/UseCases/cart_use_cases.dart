import 'package:greenleaf/Core/Utils/Params/params.dart';
import 'package:greenleaf/Features/Cart/Domain/Entity/cart_product.dart';
import 'package:greenleaf/Features/Cart/Domain/Repository/cart_repo.dart';

class GetCartItemsUseCase implements UseCase<List<CartProduct>, void> {
  final CartRepo _cartRepo;

  const GetCartItemsUseCase(this._cartRepo);
  @override
  Future<List<CartProduct>> call(void params) async {
    return await _cartRepo.getCartItems();
  }
}

class AddToCartUseCase implements UseCase<void, CartProduct> {
  final CartRepo _cartRepo;

  const AddToCartUseCase(this._cartRepo);
  @override
  Future<void> call(CartProduct entity) async {
    return await _cartRepo.addToCart(entity: entity);
  }
}

class RemoveFromCartUseCase implements UseCase<void, String> {
  final CartRepo _cartRepo;

  const RemoveFromCartUseCase(this._cartRepo);
  @override
  Future<void> call(String plantId) async {
    return await _cartRepo.removeFromCart(plantId: plantId);
  }
}
