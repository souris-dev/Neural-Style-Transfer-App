// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StyleOptionsStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StyleOptionsStore on _StyleOptionsStore, Store {
  final _$isStyleOptionsOpenAtom =
      Atom(name: '_StyleOptionsStore.isStyleOptionsOpen');

  @override
  bool get isStyleOptionsOpen {
    _$isStyleOptionsOpenAtom.reportRead();
    return super.isStyleOptionsOpen;
  }

  @override
  set isStyleOptionsOpen(bool value) {
    _$isStyleOptionsOpenAtom.reportWrite(value, super.isStyleOptionsOpen, () {
      super.isStyleOptionsOpen = value;
    });
  }

  final _$_StyleOptionsStoreActionController =
      ActionController(name: '_StyleOptionsStore');

  @override
  void openStyleOptions() {
    final _$actionInfo = _$_StyleOptionsStoreActionController.startAction(
        name: '_StyleOptionsStore.openStyleOptions');
    try {
      return super.openStyleOptions();
    } finally {
      _$_StyleOptionsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void closeStyleOptions() {
    final _$actionInfo = _$_StyleOptionsStoreActionController.startAction(
        name: '_StyleOptionsStore.closeStyleOptions');
    try {
      return super.closeStyleOptions();
    } finally {
      _$_StyleOptionsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toogleStyleOptions() {
    final _$actionInfo = _$_StyleOptionsStoreActionController.startAction(
        name: '_StyleOptionsStore.toogleStyleOptions');
    try {
      return super.toogleStyleOptions();
    } finally {
      _$_StyleOptionsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isStyleOptionsOpen: ${isStyleOptionsOpen}
    ''';
  }
}
