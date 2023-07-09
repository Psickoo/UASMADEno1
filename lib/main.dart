import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Counter(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Counter App',
        home: CounterScreen(),
      ),
    );
  }
}

class Counter extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleCounter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.apple,
                  size: 48,
                ),
                Text(
                  'x${counter.count}',
                  style: TextStyle(fontSize: 48),
                ),
              ],
            ),
            SizedBox(
                height: 16), // Add some spacing between the row and the button
            ElevatedButton(
              onPressed: () {
                counter.increment();
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
