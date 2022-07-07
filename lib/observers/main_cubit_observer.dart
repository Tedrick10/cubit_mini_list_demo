// Flutter: External Libraries
import 'package:cubit/cubit.dart';

// MainCubitObserver: Observer Class
class MainCubitObserver extends CubitObserver {
  @override
  void onTransition(Cubit cubit, Transition transition) {
    print("Cubit Observer: $transition");
    super.onTransition(cubit, transition);
  }
}
