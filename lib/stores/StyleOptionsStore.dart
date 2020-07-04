import 'package:mobx/mobx.dart';

part 'StyleOptionsStore.g.dart';

class StyleOptionsStore = _StyleOptionsStore with _$StyleOptionsStore;

abstract class _StyleOptionsStore with Store {
  @observable
  bool isStyleOptionsOpen = false;

  @action
  void openStyleOptions() {
    isStyleOptionsOpen = true;
  }

  @action
  void closeStyleOptions() {
    isStyleOptionsOpen = false;
  }

  @action
  void toogleStyleOptions() {
    isStyleOptionsOpen = !isStyleOptionsOpen;
  }
}
