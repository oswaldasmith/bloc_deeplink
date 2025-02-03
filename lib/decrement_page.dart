import 'package:flutter/material.dart';


class DecrementPage extends StatefulWidget {
  const DecrementPage({super.key, required this.title});

  final String title;

  @override
  State<DecrementPage> createState() => _DecrementPageState();
}

class _DecrementPageState extends State<DecrementPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have UNpushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.remove),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
