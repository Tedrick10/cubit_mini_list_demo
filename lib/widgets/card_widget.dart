// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:cubit/cubit.dart';

// Models
import '../models/post_model.dart';

// Controllers
import '../controllers/post_cubit_controller.dart';

// CardWidget: StatefulWidget Class
class CardWidget extends StatefulWidget {
  // Final: Class Properties
  final PostModel postModel;
  final void Function()? toggleFavorite;

  // Constructor
  const CardWidget({
    required this.postModel,
    required this.toggleFavorite,
    Key? key,
  }) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.postModel.post.title),
          IconButton(
            onPressed: widget.toggleFavorite,
            icon: Icon(
              Icons.favorite_border_outlined,
              color: widget.postModel.isFavorite ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
