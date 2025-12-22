import 'package:greenleaf/Core/Utils/Params/params.dart';
import 'package:greenleaf/Features/Shared/Logic/Entity/plant.dart';

import '../Repository/home_repo.dart';

class GetItemsUseCase implements UseCase<Result<List<Plant>>, void> {
  final HomeRepo _homeRepo;

  GetItemsUseCase(this._homeRepo);
  @override
  Future<Result<List<Plant>>> call(void params) async {
    return await _homeRepo.getItems();
  }
}
