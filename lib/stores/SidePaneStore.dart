import 'package:mobx/mobx.dart';

part 'SidePaneStore.g.dart';

class SidePaneStore = _SidePaneStore with _$SidePaneStore;

abstract class _SidePaneStore with Store {
  @observable
  bool isSidePaneOpen = false;

  @action
  void closeSidePane() {
    isSidePaneOpen = false;
  }

  @action
  void openSidePane() {
    isSidePaneOpen = true;
  }

  @action
  void toggleSidePane() {
    isSidePaneOpen = !isSidePaneOpen;
  }
}
