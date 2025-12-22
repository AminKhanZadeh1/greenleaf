import 'package:dartz/dartz.dart';
import 'package:greenleaf/Core/Utils/Failures/failures.dart';
import 'package:greenleaf/Core/Utils/Params/params.dart';
import 'package:greenleaf/Features/Home/Domain/Repository/home_repo.dart';
import '../../../Shared/Logic/Entity/plant.dart';
import '../Models/plant_model.dart';
import '../Source/Remote/home_api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeApiService _apiService;

  HomeRepoImpl(this._apiService);
  @override
  Future<Result<List<Plant>>> getItems() async {
    final result = await _apiService.getItems();
    return result.fold(
      (l) {
        return Left(UnknownFailure("Convert failed!"));
      },
      (r) {
        final productListJson = r['products'] as List;
        final List<Plant> plantEntities = productListJson
            .map((json) => PlantModel.fromJson(json).toEntity())
            .toList();
        return Right(plantEntities);
      },
    );
  }
}
