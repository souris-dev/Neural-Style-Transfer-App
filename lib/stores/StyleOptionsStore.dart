import 'package:mobx/mobx.dart';
import '../utils/StyleOptions.dart';

part 'StyleOptionsStore.g.dart';

class StyleOptionsStore = _StyleOptionsStore with _$StyleOptionsStore;

abstract class _StyleOptionsStore with Store {
  @observable
  bool isStyleOptionsOpen = false;
  int currentSelectedStyleOptionIndex = 2;

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

  @action
  void setCurrentSelectedStyleIdx(int index) {
    currentSelectedStyleOptionIndex = index;
  }
}
