// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatStore on ChatStoreBase, Store {
  final _$loadingAtom = Atom(name: 'ChatStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$loadAsyncAction = AsyncAction('ChatStoreBase.load');

  @override
  Future load({int page, int size = 20}) {
    return _$loadAsyncAction.run(() => super.load(page: page, size: size));
  }

  final _$sendAsyncAction = AsyncAction('ChatStoreBase.send');

  @override
  Future send(ChatItem chat) {
    return _$sendAsyncAction.run(() => super.send(chat));
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
