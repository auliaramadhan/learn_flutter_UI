import 'package:flutter/material.dart';
import 'package:flutter_ui/extends_utility/utils.dart';

class BasicKeyPage extends StatelessWidget {
  final keyCounter = GlobalKey<_CounterWidgetState>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final themeData = Theme.of(context).buttonTheme;
    final scaffold = Scaffold.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Key'),
        centerTitle: true,
      ),
      body: Center(
        child: CounterWidget(key: keyCounter),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final counter = keyCounter.currentState!.counter;

          keyCounter.currentState!.increment();
          final newCounter = keyCounter.currentState!.counter;

          Utils.showSnackBar(context, text: 'Counter: $counter -> $newCounter');
        },
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;

  void increment() => setState(() => counter += 5);

  @override
  Widget build(BuildContext context) => Text(
        'Counter: $counter',
        style: const TextStyle(fontSize: 32),
      );
}
