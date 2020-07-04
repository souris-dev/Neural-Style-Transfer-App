// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SidePaneStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SidePaneStore on _SidePaneStore, Store {
  final _$isSidePaneOpenAtom = Atom(name: '_SidePaneStore.isSidePaneOpen');

  @override
  bool get isSidePaneOpen {
    _$isSidePaneOpenAtom.reportRead();
    return super.isSidePaneOpen;
  }

  @override
  set isSidePaneOpen(bool value) {
    _$isSidePaneOpenAtom.reportWrite(value, super.isSidePaneOpen, () {
      super.isSidePaneOpen = value;
    });
  }

  final _$_SidePaneStoreActionController =
      ActionController(name: '_SidePaneStore');

  @override
  void closeSidePane() {
    final _$actionInfo = _$_SidePaneStoreActionController.startAction(
        name: '_SidePaneStore.closeSidePane');
    try {
      return super.closeSidePane();
    } finally {
      _$_SidePaneStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void openSidePane() {
    final _$actionInfo = _$_SidePaneStoreActionController.startAction(
        name: '_SidePaneStore.openSidePane');
    try {
      return super.openSidePane();
    } finally {
      _$_SidePaneStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSidePane() {
    final _$actionInfo = _$_SidePaneStoreActionController.startAction(
        name: '_SidePaneStore.toggleSidePane');
    try {
      return super.toggleSidePane();
    } finally {
      _$_SidePaneStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSidePaneOpen: ${isSidePaneOpen}
    ''';
  }
}
