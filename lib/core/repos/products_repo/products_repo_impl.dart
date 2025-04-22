import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub/core/services/database_service.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;
  @override
  Future<List<Either<Failure, List<ProductEntity>>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<List<Either<Failure, List<ProductEntity>>>> getProducts() {
    throw UnimplementedError();
  }
}
