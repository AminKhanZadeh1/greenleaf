import 'package:dartz/dartz.dart';
import 'package:greenleaf/Core/Utils/Failures/failures.dart';

typedef Result<T> = Either<Failure, T>;

abstract class UseCase<T, Params> {
  Future<T> call(Params params);
}
