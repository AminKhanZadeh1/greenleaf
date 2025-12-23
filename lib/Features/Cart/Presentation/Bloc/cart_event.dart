part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class GetCartItemsEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final CartProduct cartProduct;

  AddToCartEvent(this.cartProduct);
}

class RemoveFromCartEvent extends CartEvent {
  final String id;

  RemoveFromCartEvent({required this.id});
}

class ClearCartEvent extends CartEvent {}
