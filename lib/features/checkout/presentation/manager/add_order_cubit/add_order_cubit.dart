import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.ordersRepo) : super(AddOrderInitial());

  final OrdersRepo ordersRepo;

  addOrder({required OrderInputEntity orderEntity}) async {
    emit(AddOrderLoading());
    var result = await ordersRepo.addOrders(orderEntity: orderEntity);
    result.fold(
      (failure) => emit(AddOrderFailure(failure.errMessage)),
      (r) => emit(AddOrderSuccess()),
    );
  }
}
