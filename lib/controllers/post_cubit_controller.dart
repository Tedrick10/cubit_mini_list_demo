// Flutter: External Libraries
import 'package:cubit/cubit.dart';

// Models
import '../models/post_model.dart';
import '../models/post_from_api_model.dart';

// API Providers
import '../apis/post_api_provider.dart';

// PostCubitController: Controller Class
class PostCubitController extends Cubit<List<PostModel>> {
  // Constructor
  // Initialize the empty array in constructor
  PostCubitController() : super([]);

  // Action: Class Methods
  // Fetch posts from API
  Future<void> getPosts() async {
    PostAPIProvider postAPIProvider = PostAPIProvider();
    List<PostModel> postsList = await postAPIProvider.getPosts();
    if (state.isEmpty) {
      emit(postsList);
    }
  }

  // To select or not to add in favorite section
  void toggleFavorite(PostModel postModel) {
    List<PostModel> tempPostModel = state;
    int index = tempPostModel
        .indexWhere((element) => element.post.id == postModel.post.id);
    tempPostModel[index].isFavorite = !tempPostModel[index].isFavorite;
    emit(tempPostModel);
  }
}
