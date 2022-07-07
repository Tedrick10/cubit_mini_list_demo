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

// MenuPostsWidget: StatefulWidget Class
class MenuPostsWidget extends StatefulWidget {
  // Constructor
  const MenuPostsWidget({Key? key}) : super(key: key);

  // CreateState: Override Class Method
  @override
  State<MenuPostsWidget> createState() => _MenuPostsWidgetState();
}

// _MenuPostsWidgetState: State Class
class _MenuPostsWidgetState extends State<MenuPostsWidget> {
  // Lifecycle: Override Class Methods
  @override
  void initState() {
    context.cubit<PostCubitController>().backdropChanged();
    super.initState();
  }

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return CubitBuilder<PostCubitController, List<PostModel>>(
        builder: (BuildContext context, List<PostModel> state) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: state.length,
        itemBuilder: (BuildContext context, int index) {
          return CardWidget(
            postModel: state[index],
            toggleFavorite: () {
              context.cubit<PostCubitController>().toggleFavorite(state[index]);
            },
          );
        },
      );
    });
  }
}
