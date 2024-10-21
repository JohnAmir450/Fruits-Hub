part of 'products_cubit_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsCubitInitialState extends ProductsState {}

final class ProductsCubitLoadingState extends ProductsState {}

final class ProductsCubitSuccessState extends ProductsState {
  final List<ProductEntity> products;
  ProductsCubitSuccessState({required this.products});
}

final class ProductsCubitFailureState extends ProductsState {
  final String errMessage;

  ProductsCubitFailureState({required this.errMessage});
}


