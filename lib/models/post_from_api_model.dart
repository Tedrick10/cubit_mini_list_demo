// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// PostFromAPIModel: Model Class
class PostFromAPIModel {
  // Final: Class Properties
  final int userId;
  final int id;
  final String title;

  // Constructor
  PostFromAPIModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  // Convert JSON To Model
  PostFromAPIModel.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'];

  // Convert Model To JSON
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
      };
}
