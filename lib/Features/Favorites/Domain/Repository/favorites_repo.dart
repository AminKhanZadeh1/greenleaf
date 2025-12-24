abstract class FavoritesRepo {
  Future<List<String>> getFavorites();

  Future<void> addToFavorites(String id);

  Future<void> removeFromFavorites(String id);
}
