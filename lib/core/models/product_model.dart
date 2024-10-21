import 'dart:io';

import 'package:fruit_hub/core/entities/product_entitiy.dart';
import 'package:fruit_hub/core/models/review_model.dart';

class ProductModel {
  final String name;
  final num price;
  final String description;
  final String code;
   File? fileImage;
   bool? isFeatured;
   String? imageUrl;
   final int? expirationMonths;
   bool? isOrganic;
  final int? uintAmount;
  final int? numberOfCalories;
   num avgRating=0;
   num ratingCount=0;
   final List<ReviewModel>reviews;
  ProductModel({
    required this.expirationMonths,
    required this.isOrganic,
    required this.uintAmount,
    required this.numberOfCalories,
    required this.name,
    required this.price,
    required this.description,
    required this.code,
     this.fileImage,
    required this.isFeatured,
    this.imageUrl,
    required this.reviews
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      code: json['code'],
      
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      expirationMonths: json['expirationMonths'],
      isOrganic: json['isOrganic'],
      uintAmount: json['uintAmount'],
      numberOfCalories: json['numberOfCalories'],
      reviews: json['reviews'] != null
        ? List<ReviewModel>.from(json['reviews'].map((x) => ReviewModel.fromJson(x)))
        : [],
    );
  }

  factory ProductModel.fromEntity(ProductEntity addProductEntity) {
    return ProductModel(
      name: addProductEntity.name,
      price: addProductEntity.price,
      description: addProductEntity.description,
      code: addProductEntity.code,
      fileImage: addProductEntity.fileImage,
      isFeatured: addProductEntity.isFeatured,
      imageUrl: addProductEntity.imageUrl,
      expirationMonths: addProductEntity.expirationMonths,
      isOrganic: addProductEntity.isOrganic,
      uintAmount: addProductEntity.uintAmount,
      numberOfCalories: addProductEntity.numberOfCalories,
      reviews: addProductEntity.reviews != null
        ? addProductEntity.reviews!.map((e) => ReviewModel.fromEntity(e)).toList()
        : [],
    );
  }
  toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'code': code,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'uintAmount': uintAmount,
      'numberOfCalories': numberOfCalories,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
  ProductEntity toEntity(){
    return ProductEntity(
      name: name,
      price: price,
      description: description,
      code: code,
      
      isFeatured: isFeatured??false,
      imageUrl: imageUrl,
      expirationMonths: expirationMonths??12,
      isOrganic: isOrganic??false,
      uintAmount: uintAmount??0,
      numberOfCalories: numberOfCalories??0,
      reviews: reviews.map((e) => e.toEntity()).toList(), 
    );
  }
}
