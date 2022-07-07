// Flutter: External Libraries
import 'package:cubit/cubit.dart';

// CounterCubitController: Controller Class
class CounterCubitController extends Cubit<int> {
  // Constructor
  CounterCubitController() : super(1);

  // Action: Class Methods
  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}
