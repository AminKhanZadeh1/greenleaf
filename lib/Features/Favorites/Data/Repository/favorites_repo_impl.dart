import 'package:greenleaf/Features/Favorites/Data/Source/Local/favorites_local_source.dart';
import 'package:greenleaf/Features/Favorites/Domain/Repository/favorites_repo.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final FavoritesLocalSource _localSource;

  const FavoritesRepoImpl(this._localSource);
  @override
  Future<void> addToFavorites(String id) async {
    return await _localSource.addToFavs(id);
  }

  @override
  Future<List<String>> getFavorites() async {
    return await _localSource.getFavItems();
  }

  @override
  Future<void> removeFromFavorites(String id) async {
    return await _localSource.removeFromFavs(id);
  }
}
