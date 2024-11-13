import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwik_buy/features/explore/data/models/result/result.dart';
import 'package:qwik_buy/features/explore/data/repos/explore_repo.dart';

part 'fresh_drops_state.dart';

class FreshDropsCubit extends Cubit<FreshDropsState> {
  FreshDropsCubit(this.exploreRepo) : super(FreshDropsInitial());
  final ExploreRepo exploreRepo;
  Future<void> fetchFreshDrops() async {
    emit(FreshDropsLoading());
    var response = await exploreRepo.fetchFreshDrops();
    response.fold(
      (failure) {
        emit(FreshDropsFailure(failure.errMessage));
      },
      (result) {
        emit(FreshDropsSuccess(result));
      },
    );
  }
}
