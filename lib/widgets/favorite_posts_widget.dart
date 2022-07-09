// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:flutter_cubit/flutter_cubit.dart';

// APIs
import '../apis/post_api_provider.dart';

// Widgets
import './card_widget.dart';

// Models
import '../models/post_model.dart';

// Controllers
import '../controllers/post_cubit_controller.dart';

// FavoritePostsWidget: StatefulWidget Class
class FavoritePostsWidget extends StatefulWidget {
  // Constructor
  const FavoritePostsWidget({Key? key}) : super(key: key);

  // CreateState: Override Class Method
  @override
  State<FavoritePostsWidget> createState() => _FavoritePostsWidgetState();
}

// _FavoritePostsWidgetState: State Class
class _FavoritePostsWidgetState extends State<FavoritePostsWidget> {
  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return CubitBuilder<PostCubitController, List<PostModel>>(
        builder: (BuildContext context, List<PostModel> state) {
      List<PostModel> favoritePostsList =
          state.where((element) => element.isFavorite == true).toList();

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Total: ${favoritePostsList.length}",
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: favoritePostsList.length,
              itemBuilder: (BuildContext context, int index) {
                return CardWidget(
                  postModel: favoritePostsList[index],
                  toggleFavorite: () {
                    context
                        .cubit<PostCubitController>()
                        .toggleFavorite(favoritePostsList[index]);
                  },
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
