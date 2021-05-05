import 'dart:developer';

import 'package:cubit/cubit.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => {
        if (state > 0) {emit(state - 1)}
      };
}
