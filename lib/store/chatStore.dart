import 'package:revolution/model/chatItem.dart';
import 'package:revolution/utils/lazy.dart';
import 'package:mobx/mobx.dart';

part 'chatStore.g.dart';

class ChatStore extends ChatStoreBase with _$ChatStore {
  static final Lazy<ChatStore> _lazy = Lazy<ChatStore>(() => new ChatStore());

  static ChatStore get instance => _lazy.value;
}

abstract class ChatStoreBase with Store {
  ObservableList<ChatItem> chats = new ObservableList();

  @observable
  bool loading;

  @action
  load({int page, int size = 20}) async {
    if (loading == true) {
      return;
    }
    try {
      loading = true;
      // if (page <= 1) {
      chats.clear();
      // }
      chats.addAll(
        List.generate(
          100,
          (index) => ChatItem(
            writer: index % 3 != 0 ? 'you' : 'me',
            createdTime: DateTime.now().add(Duration(minutes: index * 1)),
            contents: 'contents $index',
          ),
        ),
      );
    } finally {
      loading = false;
    }
  }

  @action
  send(ChatItem chat) async {
    if (loading == true) {
      return;
    }
    try {
      loading = true;
      // if (page <= 1) {
      //   chats.clear();
      // }
      chats.add(chat);
    } finally {
      loading = false;
    }
  }
}
