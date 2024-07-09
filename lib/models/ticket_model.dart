// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Ticket {
  String title;
  String description;
  String image;
  List<String> tags;
  int demandCount;
  Ticket({
    required this.title,
    required this.description,
    required this.image,
    required this.tags,
    required this.demandCount,
  });
  

  Ticket copyWith({
    String? title,
    String? description,
    String? image,
    List<String>? tags,
    int? demandCount,
  }) {
    return Ticket(
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      tags: tags ?? this.tags,
      demandCount: demandCount ?? this.demandCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
      'tags': tags,
      'demandCount': demandCount,
    };
  }

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      demandCount: map['demandCount'] as int,
      tags: List<String>.from((map['tags'] as List<String>),
    ));
  }

  String toJson() => json.encode(toMap());

  factory Ticket.fromJson(String source) => Ticket.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Ticket(title: $title, description: $description, image: $image, tags: $tags, demandCount: $demandCount)';
  }

  @override
  bool operator ==(covariant Ticket other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.description == description &&
      other.image == image &&
      listEquals(other.tags, tags) &&
      other.demandCount == demandCount;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      description.hashCode ^
      image.hashCode ^
      tags.hashCode ^
      demandCount.hashCode;
  }
}
