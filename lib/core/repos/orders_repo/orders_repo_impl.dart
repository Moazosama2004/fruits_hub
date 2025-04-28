import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/utils/backend_end_point.dart';
import 'package:fruits_hub/features/checkout/data/models/order_model.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService databaseService;

  OrdersRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, void>> addOrders({
    required OrderEntity orderEntity,
  }) async {
    try {
      var result = await databaseService.addData(
        path: BackendEndPoint.addOrders,
        data: OrderModel.fromEntity(orderEntity).toJson(),
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
