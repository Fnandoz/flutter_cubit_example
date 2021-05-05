import 'package:cubit_example/cubit_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

void main() {
  runApp(CubitCounter());
}

class CubitCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CubitProvider(
        create: (_) => CounterCubit(),
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit Example"),
      ),
      body: CubitBuilder<CounterCubit, int>(builder: (_, count) {
        return Center(
          child: Text("$count"),
        );
      }),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: context.cubit<CounterCubit>().increment,
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: FloatingActionButton(
                child: Icon(Icons.remove),
                onPressed: context.cubit<CounterCubit>().decrement,
              ))
        ],
      ),
    );
  }
}
