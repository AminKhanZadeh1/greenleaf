part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class GetCartItemsSuccessState extends CartState {
  final List<CartProduct> items;

  GetCartItemsSuccessState(this.items);
}

class AddedToCartState extends CartState {}

class RemovedFromCartState extends CartState {}
