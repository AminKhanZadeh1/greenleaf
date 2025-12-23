import 'package:flutter_test/flutter_test.dart';
import 'package:greenleaf/Features/Cart/Domain/Entity/cart_product.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:greenleaf/Features/Cart/Data/Repository/cart_repo_impl.dart';
import 'package:greenleaf/Features/Cart/Data/Source/Local/cart_local_source.dart';
import 'package:greenleaf/Features/Cart/Data/Models/cart_product_model.dart';

@GenerateMocks([CartLocalSource])
import 'repo_unit_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockCartLocalSource mockLocalSource;
  late CartRepoImpl repo;

  setUp(() {
    mockLocalSource = MockCartLocalSource();
    repo = CartRepoImpl(mockLocalSource);
  });

  final CartProduct entity = CartProduct(
    id: '1',
    name: 'Rose',
    price: 0.99,
    imageUrl: '',
    quantity: 1,
  );

  final CartProductModel model = CartProductModel.fromEntity(entity);

  test('getCartItems returns mapped entities', () async {
    when(mockLocalSource.getCartItems()).thenAnswer((_) async => [model]);

    final result = await repo.getCartItems();

    expect(result.length, 1);
    expect(result.first.id, entity.id);
    verify(mockLocalSource.getCartItems()).called(1);
  });

  test('addToCart calls localSource with model', () async {
    when(
      mockLocalSource.addToCart(any),
    ).thenAnswer((_) async => Future.value());

    await repo.addToCart(entity: entity);

    verify(
      mockLocalSource.addToCart(argThat(isA<CartProductModel>())),
    ).called(1);
  });

  test('removeFromCart calls localSource with correct id', () async {
    when(
      mockLocalSource.removeFromCart(entity.id),
    ).thenAnswer((_) async => Future.value());

    await repo.removeFromCart(plantId: entity.id);

    verify(mockLocalSource.removeFromCart(entity.id)).called(1);
  });
}
