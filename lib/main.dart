import 'package:bloc_counter/bloc/counter_bloc.dart';
import 'package:bloc_counter/bloc/counter_event.dart';
import 'package:bloc_counter/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(), child: HomeMainPage()),
    );
  }
}

class HomeMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // membuat variabel untuk input eventnya
    final CounterBloc cbloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Plugin '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // bagian text nya (buat nampilin) dibungkus dengan BlocBuilder
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, counterState) => Text(
                counterState.nilai.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    //input event ke bloc
                    cbloc.add(Decrement());
                  },
                  child: Icon(Icons.arrow_downward),
                ),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  onPressed: () {
                    //input event ke bloc
                    cbloc.add(Increment());
                  },
                  child: Icon(Icons.arrow_upward),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
