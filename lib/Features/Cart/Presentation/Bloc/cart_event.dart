part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddToCartEvent extends CartEvent {}

class RemoveFromCartEvent extends CartEvent {}
