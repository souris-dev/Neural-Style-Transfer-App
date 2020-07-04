import 'SidePaneStore.dart';

class Stores {
  static SidePaneStore sidePaneStore;

  static void initStores() {
    sidePaneStore = SidePaneStore();
  }

  static SidePaneStore get sidePnStr {
    return sidePaneStore;
  }
}
