import 'package:bloc/bloc.dart';
import 'package:greenleaf/Features/Cart/Domain/Entity/cart_product.dart';
import 'package:greenleaf/Features/Cart/Domain/Repository/cart_repo.dart';
import 'package:greenleaf/Features/Cart/Domain/UseCases/cart_use_cases.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo _cartRepo;
  // Use Cases
  late GetCartItemsUseCase _getCartItemsUseCase;
  late AddToCartUseCase _addToCartUseCase;
  late RemoveFromCartUseCase _removeFromCartUseCase;
  CartBloc(this._cartRepo) : super(CartInitial()) {
    _getCartItemsUseCase = GetCartItemsUseCase(_cartRepo);
    _addToCartUseCase = AddToCartUseCase(_cartRepo);
    _removeFromCartUseCase = RemoveFromCartUseCase(_cartRepo);
    on<GetCartItemsEvent>((event, emit) async {
      final result = await _getCartItemsUseCase.call(null);
      emit(GetCartItemsSuccessState(result));
    });
    on<AddToCartEvent>((event, emit) async {
      await _addToCartUseCase.call(event.cartProduct);
      emit(AddedToCartState());
    });
    on<RemoveFromCartEvent>((event, emit) async {
      await _removeFromCartUseCase.call(event.id);
      emit(RemovedFromCartState());
    });
    on<ClearCartEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    });
  }
}
