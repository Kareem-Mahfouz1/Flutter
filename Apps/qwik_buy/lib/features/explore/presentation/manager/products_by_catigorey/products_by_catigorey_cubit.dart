import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/result/result.dart';
import '../../../data/repos/explore_repo.dart';

part 'products_by_catigorey_state.dart';

class ProductsByCatigoreyCubit extends Cubit<ProductsByCatigoreyState> {
  ProductsByCatigoreyCubit(this.exploreRepo)
      : super(ProductsByCatigoreyInitial());
  final ExploreRepo exploreRepo;

  Future<void> fetchProductsByCategorey(int id) async {
    emit(ProductsByCatigoreyLoading());
    final resposne = await exploreRepo.fetchProductsByCategorey(id: id);
    resposne.fold(
      (failure) {
        emit(ProductsByCatigoreyFailure(failure.errMessage));
      },
      (result) {
        emit(ProductsByCatigoreySuccess(result));
      },
    );
  }
}
