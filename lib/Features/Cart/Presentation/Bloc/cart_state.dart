part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class AddedToCartState extends CartState {}

class RemovedFromCartState extends CartState {}
