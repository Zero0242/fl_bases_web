import 'package:fl_bases_web/config/config.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class Theme extends _$Theme {
  GetStorage get _storage => GetStorage();

  @override
  bool build() {
    return true;
  }

  void setMode(bool val) {
    state = val;
  }

  void setDarkMode() async {
    state = true;
    await _storage.write(StorageKeys.theme, 'dark');
  }

  void setLightMode() async {
    state = false;
    await _storage.write(StorageKeys.theme, 'light');
  }

  void toggleMode() {
    state ? setLightMode() : setDarkMode();
  }
}
