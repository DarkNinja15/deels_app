// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Product {
  String prodId;
  String title;
  String description;
  String userId;
  String userPhone;
  String imageUrl;
  double price;
  List<String> tags;
  Product({
    required this.prodId,
    required this.title,
    required this.description,
    required this.userId,
    required this.userPhone,
    required this.imageUrl,
    required this.price,
    required this.tags,
  });
  

  Product copyWith({
    String? prodId,
    String? title,
    String? description,
    String? userId,
    String? userPhone,
    String? imageUrl,
    double? price,
    List<String>? tags,
  }) {
    return Product(
      prodId: prodId ?? this.prodId,
      title: title ?? this.title,
      description: description ?? this.description,
      userId: userId ?? this.userId,
      userPhone: userPhone ?? this.userPhone,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'prodId': prodId,
      'title': title,
      'description': description,
      'userId': userId,
      'userPhone': userPhone,
      'imageUrl': imageUrl,
      'price': price,
      'tags': tags,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      prodId: map['prodId'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      userId: map['userId'] as String,
      userPhone: map['userPhone'] as String,
      imageUrl: map['imageUrl'] as String,
      price: map['price'] as double,
      tags: List<String>.from((map['tags'] as List<String>),
    ));
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(prodId: $prodId, title: $title, description: $description, userId: $userId, userPhone: $userPhone, imageUrl: $imageUrl, price: $price, tags: $tags)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.prodId == prodId &&
      other.title == title &&
      other.description == description &&
      other.userId == userId &&
      other.userPhone == userPhone &&
      other.imageUrl == imageUrl &&
      other.price == price &&
      listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return prodId.hashCode ^
      title.hashCode ^
      description.hashCode ^
      userId.hashCode ^
      userPhone.hashCode ^
      imageUrl.hashCode ^
      price.hashCode ^
      tags.hashCode;
  }
}
