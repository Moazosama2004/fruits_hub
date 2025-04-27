import 'package:bloc/bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);

  void addProductItem(ProductEntity productEntity) {
    CartItemEntity cartItemEntity = cartEntity.getCartItem(productEntity);
    bool isExsits = cartEntity.isExsits(productEntity);
    if (isExsits) {
      cartItemEntity.increaseCount();
    } else {
      cartEntity.addCartItem(cartItemEntity);
    }
    emit(CartItemAdded());
  }

  void removeCartItem(CartItemEntity cartItemEntity) {
    cartEntity.removeCartItem(cartItemEntity);
    emit(CartItemRemoved());
  }
}
