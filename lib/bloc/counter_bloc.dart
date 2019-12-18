import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  // inisiasi nilai awal state
  CounterState get initialState => CounterState(0);

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    yield
        // masukkan logic nya/ actionnya
        (event is Increment)
            ? CounterState(state.nilai + 1)
            : CounterState(state.nilai - 1);
  }
}
