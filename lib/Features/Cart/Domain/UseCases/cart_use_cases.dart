import 'package:greenleaf/Core/Utils/Params/params.dart';
import 'package:greenleaf/Features/Cart/Domain/Repository/cart_repo.dart';

class AddToCartUseCase implements UseCase<void, void> {
  final CartRepo _cartRepo;

  const AddToCartUseCase(this._cartRepo);
  @override
  Future<void> call(void params) async {
    return await _cartRepo.addToCart();
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
