import 'dart:math';

import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/entities/review_entity.dart';
import 'package:fruits_hub/core/helper/get_average_rating.dart';
import 'package:image_picker/image_picker.dart';

import 'review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;

  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  int sellingCount;
  final int unitAmount;
  final num avgRating;
  final num ratingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeatured,
    required this.avgRating,
    required this.ratingCount,
    required this.expirationsMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    this.sellingCount = 0,
    this.imageUrl,
    required this.reviews,
  });

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      avgRating: entity.avgRating,
      ratingCount: entity.ratingCount,
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      isFeatured: entity.isFeatured,
      imageUrl: entity.imageUrl,
      expirationsMonths: entity.expirationsMonths,
      unitAmount: entity.unitAmount,
      numberOfCalories: entity.numberOfCalories,
      isOrganic: entity.isOrganic,
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final reviewsJson = json['reviews'] as List<dynamic>;

    final parsedReviews =
        reviewsJson
            .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
            .toList();
    return ProductModel(
      name: json['name'],
      code: json['code'],
      description: json['description'],
      price: json['price'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      unitAmount: json['unitAmount'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      expirationsMonths: json['expirationsMonths'],
      ratingCount: json['ratingCount'],
      reviews: parsedReviews,
      avgRating: getAverageRating(
        parsedReviews.map((e) => e.toEntity()).toList(),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'sellingCount': sellingCount,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      expirationsMonths: expirationsMonths,
      unitAmount: unitAmount,
      numberOfCalories: numberOfCalories,
      isOrganic: isOrganic,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      avgRating: avgRating,
      ratingCount: ratingCount,
    );
  }
}
