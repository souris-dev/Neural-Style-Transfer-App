import 'SidePaneStore.dart';
import 'StyleOptionsStore.dart';

class Stores {
  static SidePaneStore sidePaneStore;
  static StyleOptionsStore styleOptionsStore;

  static void initStores() {
    sidePaneStore = SidePaneStore();
    styleOptionsStore = StyleOptionsStore();
  }

  static SidePaneStore get sidePnStr {
    return sidePaneStore;
  }

  static StyleOptionsStore get styleOptStr {
    return styleOptionsStore;
  }
}
