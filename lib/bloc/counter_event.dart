import 'package:meta/meta.dart';

@immutable
abstract class CounterEvent {}

// membuat class event yang akan digunakan
class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}
