import 'package:fl_bases_web/config/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class Theme extends _$Theme {
  @override
  FutureOr<bool> build() async {
    final key = await StoragePlugin.read(StorageKeys.theme);
    return key == 'dark';
  }

  void setMode(bool val) {
    state = AsyncData(val);
  }

  void setDarkMode() async {
    state = AsyncData(true);
    await StoragePlugin.write(StorageKeys.theme, 'dark');
  }

  void setLightMode() async {
    state = AsyncData(false);
    await StoragePlugin.write(StorageKeys.theme, 'light');
  }

  void toggleMode() {
    state.requireValue ? setLightMode() : setDarkMode();
  }
}
