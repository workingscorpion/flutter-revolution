import 'package:revolution/model/listItem.dart';
import 'package:revolution/utils/lazy.dart';
import 'package:mobx/mobx.dart';

part 'infiniteScrollStore.g.dart';

class InfiniteScrollStore extends InfiniteScrollStoreBase
    with _$InfiniteScrollStore {
  static final Lazy<InfiniteScrollStore> _lazy =
      Lazy<InfiniteScrollStore>(() => new InfiniteScrollStore());

  static InfiniteScrollStore get instance => _lazy.value;
}

abstract class InfiniteScrollStoreBase with Store {
  ObservableList list = new ObservableList();

  List<ListItem> newList = new List<ListItem>.generate(
    100,
    (index) => ListItem(title: '$index Item'),
  );

  @observable
  bool loading;

  @action
  load({int page, int size = 20}) async {
    if (loading == true) {
      return;
    }
    try {
      loading = true;
      if (page <= 1) {
        list.clear();
      }
      list.addAll(newList.skip((page - 1) * 10).take(size));
    } finally {
      loading = false;
    }
  }
}
