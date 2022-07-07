// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Models
import './post_from_api_model.dart';

// PostModel: Model Class
class PostModel {
  // Final: Class Properties
  final PostFromAPIModel post;
  bool isFavorite;

  // Constructor
  PostModel({
    required this.post,
    required this.isFavorite,
  });

  // Convert JSON To Model
  PostModel.fromJson(Map<String, dynamic> json)
      : post = json['post'],
        isFavorite = json['isFavorite'];

  // Convert Model To JSON
  Map<String, dynamic> toJson() => {
        'post': post,
        'isFavorite': isFavorite,
      };
}
