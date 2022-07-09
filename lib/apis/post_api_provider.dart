// Flutter: External Libraries
import 'package:dio/dio.dart';

// Models
import '../models/post_from_api_model.dart';
import '../models/post_model.dart';

// PostAPIProvider: APIProvider Class
class PostAPIProvider {
  Future<List<PostModel>> getPosts() async {
    List<PostModel> postList = [];
    try {
      var response =
          await Dio().get("https://jsonplaceholder.typicode.com/posts");
      List<dynamic> postsFromAPI = response.data;

      for (var post in postsFromAPI) {
        PostFromAPIModel dummyPostFromAPIModel =
            PostFromAPIModel.fromJson(post);
        PostModel dummyPostModel = PostModel(
          post: dummyPostFromAPIModel,
          isFavorite: false,
        );
        postList.add(dummyPostModel);
      }
    } catch (e) {
      print(e);
    }
    return postList;
  }
}
