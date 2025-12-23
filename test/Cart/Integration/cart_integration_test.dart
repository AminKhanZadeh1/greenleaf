import 'package:flutter_test/flutter_test.dart';
import 'package:greenleaf/Core/Utils/DI/locator.dart';
import 'package:greenleaf/Features/Cart/Data/Repository/cart_repo_impl.dart';
import 'package:greenleaf/Features/Cart/Data/Source/Local/cart_local_source.dart';
import 'package:greenleaf/Features/Cart/Domain/Entity/cart_product.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late CartRepoImpl repository;

  setUp(() async {
    await locator.reset();

    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    locator.registerSingleton<CartLocalSource>(CartLocalSource(prefs));

    repository = CartRepoImpl(locator<CartLocalSource>());
  });

  tearDown(() async {
    await locator.reset();
  });

  test("Add item to cart and get items", () async {
    final product = CartProduct(
      id: '1',
      name: 'Rose',
      price: 0.99,
      imageUrl: 'r',
      quantity: 1,
    );

    await repository.addToCart(entity: product);

    final items = await repository.getCartItems();

    expect(items, isNotEmpty);
    expect(items.first.id, product.id);
    expect(items.first.quantity, 1);
  });

  test("Remove item from cart", () async {
    final productId = '1';

    await repository.removeFromCart(plantId: productId);

    final items = await repository.getCartItems();

    expect(items.where((p) => p.id == productId), isEmpty);
  });
}
