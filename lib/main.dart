import 'package:bloc_deeplink/decrement_page.dart';
import 'package:bloc_deeplink/increment_bloc.dart';
import 'package:bloc_deeplink/increment_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      GoRoute(
        path: '/increment',
        builder: (context, state) =>
            BlocProvider(
              create: (context) => IncrementBloc(0),
              lazy: false,
              child: IncrementPage(
                title: 'Increment', startAt: '0',),
            ),
      ),
      GoRoute(
        path: '/increment/:startAt',
        builder: (context, state) =>
            BlocProvider(
              create: (context) => IncrementBloc(int.parse(state.pathParameters['startAt']!)),
              child: IncrementPage(
                title: 'Increment', startAt: state.pathParameters['startAt']!,),
            ),
      ),
      GoRoute(
        path: '/decrement',
        builder: (context, state) => DecrementPage(title: 'Decrement'),
      ),
      GoRoute(
        path: '/decrement/startAt',
        builder: (context, state) => DecrementPage(title: 'Decrement'),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  context.push('/increment');
                },
                child: Text('Increment Page')),
            ElevatedButton(
                onPressed: () {
                  context.push('/decrement');
                },
                child: Text('Decrement Page')),
          ],
        ),
      ),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

