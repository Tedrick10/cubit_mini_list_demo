// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:flutter_cubit/flutter_cubit.dart';

// Controllers
import '../controllers/counter_cubit_controller.dart';

// HomePage: StatelessWidget Class
class HomePage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Home";
  static const String routeName = "/home";

  // Constructor
  const HomePage({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return CubitBuilder<CounterCubitController, int>(
        builder: (BuildContext context, int state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cubit State Management"),
        ),
        body: SafeArea(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: context.cubit<CounterCubitController>().state,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50.0,
                    padding: const EdgeInsets.all(10.0),
                    child: Text("List Item Count: ${(index + 1).toString()}"),
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                context.cubit<CounterCubitController>().increment();
              },
            ),
            FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () {
                context.cubit<CounterCubitController>().decrement();
              },
            ),
          ],
        ),
      );
    });
  }
}
