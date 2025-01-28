import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewModels/counter_veiw_model.dart';
import 'views/counter_veiw.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => CounterViewModel(),
        child: const CounterView(),
      ),
    );
  }
}
