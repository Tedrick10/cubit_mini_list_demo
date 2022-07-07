// Flutter: External Libraries
import 'package:dio/dio.dart';

// Models
import '../models/post_from_api_model.dart';
import '../models/post_model.dart';

// PostAPIProvider: APIProvider Class
class PostAPIProvider {
  Future<List<PostModel>> getPosts() async {
    List<PostModel> _postList = [];
    try {
      var response =
          await Dio().get("https://jsonplaceholder.typicode.com/posts");
      List<dynamic> _postsFromAPI = response.data;

      for (var post in _postsFromAPI) {
        PostFromAPIModel _dummyPostFromAPIModel =
            PostFromAPIModel.fromJson(post);
        PostModel _dummyPostModel = PostModel(
          post: _dummyPostFromAPIModel,
          isFavorite: false,
        );
        _postList.add(_dummyPostModel);
      }
    } catch (e) {
      print(e);
    }
    return _postList;
  }
}
