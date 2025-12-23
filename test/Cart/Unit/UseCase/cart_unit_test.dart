import 'package:flutter_test/flutter_test.dart';
import 'package:greenleaf/Features/Cart/Domain/Entity/cart_product.dart';
import 'package:greenleaf/Features/Cart/Domain/Repository/cart_repo.dart';
import 'package:greenleaf/Features/Cart/Domain/UseCases/cart_use_cases.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([CartRepo])
import 'cart_unit_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockCartRepo mockCartRepo;
  late AddToCartUseCase addToCartUseCase;
  late RemoveFromCartUseCase removeFromCartUseCase;
  late GetCartItemsUseCase getItemsUseCase;

  setUp(() {
    mockCartRepo = MockCartRepo();
    addToCartUseCase = AddToCartUseCase(mockCartRepo);
    removeFromCartUseCase = RemoveFromCartUseCase(mockCartRepo);
    getItemsUseCase = GetCartItemsUseCase(mockCartRepo);
  });

  final List<CartProduct> cartProducts = [
    CartProduct(id: '1', name: 'Rose', price: 0.99, imageUrl: '', quantity: 1),
    CartProduct(id: '2', name: 'Tulip', price: 1.5, imageUrl: '', quantity: 2),
  ];

  test('Get cart items', () async {
    when(mockCartRepo.getCartItems()).thenAnswer((_) async => cartProducts);

    final result = await getItemsUseCase.call(null);

    expect(result.length, cartProducts.length);
    expect(result.first.id, cartProducts.first.id);

    verify(mockCartRepo.getCartItems()).called(1);
  });

  test('Add item', () async {
    final CartProduct newProduct = CartProduct(
      id: '3',
      name: 'Lily',
      price: 2.0,
      imageUrl: '',
      quantity: 1,
    );

    when(
      mockCartRepo.addToCart(entity: anyNamed('entity')),
    ).thenAnswer((_) async => Future.value());

    await addToCartUseCase.call(newProduct);

    verify(mockCartRepo.addToCart(entity: newProduct)).called(1);
  });

  test('Remove item', () async {
    final String productId = '1';

    when(
      mockCartRepo.removeFromCart(plantId: anyNamed('plantId')),
    ).thenAnswer((_) async => Future.value());

    await removeFromCartUseCase.call(productId);

    verify(mockCartRepo.removeFromCart(plantId: productId)).called(1);
  });
}
