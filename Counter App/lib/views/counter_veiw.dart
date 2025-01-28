import 'package:eabd/viewModels/counter_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final veiwModel = Provider.of<CounterViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Veiw'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter',
            ),
            Text(
              '${veiwModel.counter}',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: veiwModel.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}