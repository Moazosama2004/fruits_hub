import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:image_picker/image_picker.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Organic Banana',
    code: 'BNN123',
    description: 'Fresh organic bananas from local farms.',
    price: 2.99,
    image: XFile(''),
    isFeatured: true,
    expirationsMonths: 2,
    isOrganic: true,
    numberOfCalories: 105,
    unitAmount: 6,
    imageUrl: 'https://example.com/images/banana.png',
    reviews: [],
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
