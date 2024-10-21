import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entities/product_entitiy.dart';
import 'package:fruit_hub/core/repos/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_cubit_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;
  ProductsCubit(this.productsRepo) : super(ProductsCubitInitialState());


  Future<void>getBestSellingProducts()async{
    emit(ProductsCubitLoadingState());
    final result = await productsRepo.getBestSelling();
    result.fold((failure) {
      emit(ProductsCubitFailureState(errMessage:  failure.message));
    }, (products) {
      emit(ProductsCubitSuccessState(products:  products));
    });
  }

  Future<void>getProducts()async{
    emit(ProductsCubitLoadingState());
    final result = await productsRepo.getProducts();
    result.fold((failure) {
      emit(ProductsCubitFailureState(errMessage:  failure.message));
    }, (products) {
      emit(ProductsCubitSuccessState(products:  products));
    });
  }
}
