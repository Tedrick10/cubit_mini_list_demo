// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:cubit/cubit.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

// Pages
import './pages/home_page.dart';
import './pages/post_page.dart';

// Observers
import './observers/main_cubit_observer.dart';

// Controllers or Providers
import './controllers/counter_cubit_controller.dart';
import './controllers/post_cubit_controller.dart';

// Main Function
void main() {
  Cubit.observer = MainCubitObserver();
  runApp(
    MultiCubitProvider(
      providers: [
        CubitProvider(create: (_) => CounterCubitController()),
        CubitProvider(create: (_) => PostCubitController()),
      ],
      child: const MyApp(),
    ),
  );
}

// MyApp: StatelessWidget Class
class MyApp extends StatelessWidget {
  // Constructor
  const MyApp({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return MaterialApp(
      title: "Cubit Counter Example",
      // initialRoute: HomePage.routeName,
      initialRoute: PostPage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
        PostPage.routeName: (_) => const PostPage(),
      },
    );
  }
}
