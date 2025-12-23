part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class FetchItemsLoadingState extends HomeState {}

class FetchItemsSuccessState extends HomeState {
  final List<Plant> plants;

  FetchItemsSuccessState(this.plants);
}

class FetchItemsFailedState extends HomeState {
  final String message;

  FetchItemsFailedState(this.message);
}
