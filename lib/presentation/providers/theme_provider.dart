import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  bool build() {
    return true;
  }

  void setDarkMode() {
    state = true;
  }

  void setLightMode() {
    state = false;
  }

  void toggleMode() {
    state = !state;
  }
}
