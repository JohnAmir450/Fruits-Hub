import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entitiy.dart';
import 'package:fruit_hub/core/errors/failures.dart';

abstract class ProductsRepo{
    Future<Either<Failure,List<ProductEntity>>> getProducts();
    
    Future<Either<Failure,List<ProductEntity>>> getBestSelling();
}