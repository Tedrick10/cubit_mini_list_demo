// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:cubit/cubit.dart';

// Widgets
import '../widgets/menu_posts_widget.dart';
import '../widgets/favorite_posts_widget.dart';

// PostPage: StatefulWidget Class
class PostPage extends StatefulWidget {
  // Static & Constant: Class Properties
  static const String title = "Post";
  static const String routeName = "/post";

  // Constructor
  const PostPage({Key? key}) : super(key: key);

  // CreateState: Override Class Method
  @override
  State<PostPage> createState() => _PostPageState();
}

// _PostPageState: State Class
class _PostPageState extends State<PostPage> {
  // Normal: Class Properties
  int _currentIndex = 0;

  // Final: Class Properties
  final List<Widget> _widgetsList = [
    const MenuPostsWidget(),
    const FavoritePostsWidget(),
  ];

  @override
  void initState() {
    super.initState();
  }

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Scaffold(
      appBar: AppBar(
        title: const Text(PostPage.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int changedIndex) {
          setState(() {
            _currentIndex = changedIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Posts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
        ],
      ),
      body: SafeArea(
        child: _widgetsList[_currentIndex],
      ),
    );
  }
}
