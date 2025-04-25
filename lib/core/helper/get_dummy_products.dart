import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:image_picker/image_picker.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Organic Banana',
    code: 'BNN123',
    description: 'Fresh organic bananas from local farms.',
    price: 2.99,
    isFeatured: true,
    expirationsMonths: 2,
    isOrganic: true,
    numberOfCalories: 105,
    unitAmount: 6,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVNN58XFDLxdqtwwWRSE924NjtuSryXFGxjg&s',
    reviews: [],
    avgRating: 0,
    ratingCount: 0,
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
