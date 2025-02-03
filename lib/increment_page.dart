import 'package:bloc_deeplink/decrement_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'increment_bloc.dart';


class IncrementPage extends StatefulWidget {
  const IncrementPage({super.key,
    required this.title,
    required this.startAt});

  final String title;
  final String startAt;

  @override
  State<IncrementPage> createState() => _IncrementPageState();
}

class _IncrementPageState extends State<IncrementPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var incrementBloc = context.read<IncrementBloc>();
    return BlocBuilder<IncrementBloc, IncrementState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(),
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .inversePrimary,

            title: Text(widget.title),
          ),
          body: Center(

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                //Text(
                //  //'$_counter',
                //  widget.startAt,
                //  style: Theme.of(context).textTheme.headlineMedium,
                //),
                Text(
                    incrementBloc.state.counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                )
                //ElevatedButton(onPressed: (){context.go('/decrement');}, child: Text('Decrement Page'))
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            //onPressed: _incrementCounter,
            onPressed: () {
              incrementBloc.add(Increment());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
