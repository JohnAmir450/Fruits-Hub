import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entitiy.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/models/product_model.dart';
import 'package:fruit_hub/core/repos/products_repo.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoints.dart';

class ProductRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSelling()async {
     try {
  var data = await databaseService.getData(path: BackendPoints.getProducts,
  query:{
    'limit':10,
    'orderBy':'sellingCount',
   'descending':true
  } 
  )
      as List<Map<String, dynamic>>;

  List<ProductEntity> products =
      data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
  
  return right(products);
}  catch (e) {
  return left(ServerFailure(message: e.toString()));
}
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
  var data = await databaseService.getData(path: BackendPoints.getProducts)
      as List<Map<String, dynamic>>;
  // List<ProductEntity> products=[];
  //     for (var item in data) {
  //     products.add(ProductModel.fromJson(item).toEntity());          
  //     }
  List<ProductEntity> products =
      data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
  
  return right(products);
}  catch (e) {
  return left(ServerFailure(message: e.toString()));
}
  }
}
