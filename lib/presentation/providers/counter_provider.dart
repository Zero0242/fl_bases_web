import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    return 0;
  }

  void increase() {
    state++;
  }

  void decrease() {
    state--;
  }

  void setCount(int value) {
    state = value;
  }
}