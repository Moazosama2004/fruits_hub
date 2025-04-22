import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';

abstract class ProductsRepo {
  Future<List<Either<Failure, List<ProductEntity>>>> getProducts();
  Future<List<Either<Failure, List<ProductEntity>>>> getBestSellingProducts();
}
