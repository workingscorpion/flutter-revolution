import 'package:revolution/utils/lazy.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'keyValueStore.g.dart';

class KeyValueStore extends KeyValueStoreBase with _$KeyValueStore {
  static final Lazy<KeyValueStore> _lazy =
      Lazy<KeyValueStore>(() => new KeyValueStore());

  static KeyValueStore get instance => _lazy.value;
}

abstract class KeyValueStoreBase with Store {
  @observable
  String scanData;

  @action
  setScanData(String value) async {
    scanData = value;
  }
}
