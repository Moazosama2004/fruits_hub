import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/entities/review_entity.dart';

num getAverageRating(List<ReviewEntity> reviews) {
  num sum = 0;
  for (ReviewEntity review in reviews) {
    sum += review.rating;
  }
  return (sum / reviews.length);
}
