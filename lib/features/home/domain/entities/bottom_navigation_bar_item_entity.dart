import 'package:fruits_hub/core/utils/app_assets.dart';

class BottomNavigationBarItemEntity {
  final String activeImage, inActiveImage;
  final String title;

  BottomNavigationBarItemEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.title,
  });
}

List<BottomNavigationBarItemEntity> get bottomNavigationBarItems => [
  BottomNavigationBarItemEntity(
    activeImage: Assets.imagesBottomNavHomeBoldIcon,
    inActiveImage: Assets.imagesBottomNavHomeOutlineIcon,
    title: 'الرئيسية',
  ),
  BottomNavigationBarItemEntity(
    activeImage: Assets.imagesBottomNavProductsBoldIcon,
    inActiveImage: Assets.imagesBottomNavProductsOutlineIcon,
    title: 'المنتجات',
  ),
  BottomNavigationBarItemEntity(
    activeImage: Assets.imagesBottomNavCartBoldIcon,
    inActiveImage: Assets.imagesBottomNavCartOutlineIcon,
    title: 'سلة التسوق',
  ),
  BottomNavigationBarItemEntity(
    activeImage: Assets.imagesBottomNavProfileBoldIcon,
    inActiveImage: Assets.imagesBottomNavProfileOutlineIcon,
    title: 'حسابي',
  ),
];
