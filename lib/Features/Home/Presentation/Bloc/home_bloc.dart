import 'package:bloc/bloc.dart';
import 'package:greenleaf/Features/Home/Domain/UseCases/home_use_cases.dart';
import 'package:greenleaf/Features/Shared/Logic/Entity/plant.dart';
import 'package:meta/meta.dart';

import '../../Domain/Repository/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo _homeRepo;
  late GetItemsUseCase _getItemsUseCase;
  HomeBloc(this._homeRepo) : super(HomeInitial()) {
    _getItemsUseCase = GetItemsUseCase(_homeRepo);
    on<GetItemsEvent>((event, emit) async {
      final result = await _getItemsUseCase.call(null);

      result.fold(
        (l) {
          emit(FetchItemsFailedState(l.message));
        },
        (r) {
          emit(FetchItemsSuccessState(r));
        },
      );
    });
  }
}
