import 'package:bloc/bloc.dart';
import 'package:greenleaf/Features/Cart/Domain/Repository/cart_repo.dart';
import 'package:greenleaf/Features/Cart/Domain/UseCases/cart_use_cases.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo _cartRepo;
  // Use Cases
  late AddToCartUseCase _addToCartUseCase;
  late RemoveFromCartUseCase _removeFromCartUseCase;
  CartBloc(this._cartRepo) : super(CartInitial()) {
    on<AddToCartEvent>((event, emit) {});
    on<RemoveFromCartEvent>((event, emit) {});
  }
}
