import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.read<OrderEntity>();
    return Column(
      children: [
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: orderEntity.cartEntity.calculateTotalPrice().toInt() + 30,
          isSelected: currentIndex == 0,
          onTap: () {
            currentIndex = 0;
            orderEntity.payWithCash = true;
            setState(() {});
          },
        ),
        const SizedBox(height: 8),
        ShippingItem(
          title: 'الدفع أونلاين ',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: orderEntity.cartEntity.calculateTotalPrice().toInt(),
          isSelected: currentIndex == 1,
          onTap: () {
            currentIndex = 1;
            orderEntity.payWithCash = false;
            setState(() {});
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
