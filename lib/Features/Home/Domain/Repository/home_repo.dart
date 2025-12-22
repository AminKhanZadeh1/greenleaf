import 'package:greenleaf/Core/Utils/Params/params.dart';

import '../../../Shared/Logic/Entity/plant.dart';

abstract class HomeRepo {
  Future<Result<List<Plant>>> getItems();
}
