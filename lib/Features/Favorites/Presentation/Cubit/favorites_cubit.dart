import 'package:bloc/bloc.dart';
import 'package:greenleaf/Features/Favorites/Domain/Repository/favorites_repo.dart';

class FavoriteCubit extends Cubit<Set<String>> {
  final FavoritesRepo _repo;

  FavoriteCubit(this._repo) : super({}) {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final ids = await _repo.getFavorites();
    emit(ids.toSet());
  }

  void add(String id) async {
    await _repo.addToFavorites(id);
    emit({...state, id});
  }

  void remove(String id) async {
    await _repo.removeFromFavorites(id);
    emit(state.where((e) => e != id).toSet());
  }

  void toggle(String id) => state.contains(id) ? remove(id) : add(id);
}
