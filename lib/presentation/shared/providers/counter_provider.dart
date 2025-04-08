import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build(String? initialValue) {
    final params = int.tryParse(initialValue ?? '0');
    return params ?? 0;
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
