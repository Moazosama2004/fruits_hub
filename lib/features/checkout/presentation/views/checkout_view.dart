import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/get_user_entity.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/add_order_cubit_bloc_consumer.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const String routeName = 'checkoutView';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late final OrderInputEntity orderEntity;

  @override
  void initState() {
    orderEntity = OrderInputEntity(
      cartEntity: widget.cartEntity,
      shippingAddressEntity: ShippingAddressEntity(),
      uId: getUserEntitiy().uId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'الشحن',
          showleadingButton: false,
          showBackButton: true,
        ),
        body: Provider.value(
          value: orderEntity,
          child: const AddOrderCubitBlocConsumer(child: CheckoutViewBody()),
        ),
      ),
    );
  }
}
