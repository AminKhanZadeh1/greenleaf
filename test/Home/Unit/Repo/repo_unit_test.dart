import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greenleaf/Features/Home/Data/Repository/home_repo_impl.dart';
import 'package:greenleaf/Features/Home/Data/Source/Remote/home_api_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([HomeApiService])
import 'repo_unit_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockHomeApiService mockApi;
  late HomeRepoImpl repoImpl;

  setUp(() {
    mockApi = MockHomeApiService();
    repoImpl = HomeRepoImpl(mockApi);
  });

  test('(Get items)', () async {
    final jsonString = {
      "products": [
        {
          "id": "1",
          "name": "Succulent Plant",
          "category": "Popular",
          "price": 39.99,
          "image_url":
              "https://raw.githubusercontent.com/amin-khademi/GreenLeaf/refs/heads/main/klipartz%2026.png",
        },
        {
          "id": "2",
          "name": "Dragon Plant",
          "category": "Popular",
          "price": 29.99,
          "image_url":
              "https://raw.githubusercontent.com/amin-khademi/GreenLeaf/refs/heads/main/klipartz%2027.png",
        },
        {
          "id": "3",
          "name": "Ravenea Plant",
          "category": "Organic",
          "price": 25.99,
          "image_url":
              "https://raw.githubusercontent.com/amin-khademi/GreenLeaf/refs/heads/main/klipartz%2029.png",
        },
        {
          "id": "4",
          "name": "Potted Aloe",
          "category": "Indoors",
          "price": 19.99,
          "image_url":
              "https://raw.githubusercontent.com/amin-khademi/GreenLeaf/refs/heads/main/klipartz%2030.png",
        },
        {
          "id": "5",
          "name": "Mini Succulent",
          "category": "Synthetic",
          "price": 15.99,
          "image_url":
              "https://raw.githubusercontent.com/amin-khademi/GreenLeaf/refs/heads/main/klipartz%2031.png",
        },
        {
          "id": "6",
          "name": "Foliage Plant",
          "category": "Organic",
          "price": 34.99,
          "image_url":
              "https://raw.githubusercontent.com/amin-khademi/GreenLeaf/refs/heads/main/klipartz%2032.png",
        },
      ],
    };

    when(mockApi.getItems()).thenAnswer((_) async => Right(jsonString));

    final result = await repoImpl.getItems();

    expect(result.isRight(), true);
    result.fold((_) => fail('should not fail'), (plants) {
      expect(plants.first.id, '1');
      expect(plants.length, 6);
    });
  });
}
