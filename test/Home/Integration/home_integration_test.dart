import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greenleaf/Core/Utils/DI/locator.dart';
import 'package:greenleaf/Core/Utils/Failures/failures.dart';
import 'package:greenleaf/Features/Home/Data/Repository/home_repo_impl.dart';
import 'package:greenleaf/Features/Shared/Logic/Entity/plant.dart';

void main() {
  late HomeRepoImpl repository;

  setUp(() async {
    await setup();
    repository = HomeRepoImpl(locator());
  });

  tearDown(() async {
    await locator.reset();
  });

  test("(Get Items from API)", () async {
    final result = await repository.getItems();

    result.fold(
      (failure) {
        return Left(UnknownFailure('Check API'));
      },
      (data) {
        return Right(data);
      },
    );

    expect(result, isA<Right<Failure, List<Plant>>>());
  });
}
