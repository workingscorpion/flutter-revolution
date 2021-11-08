class ChatItem {
  final String writer;
  final DateTime createdTime;
  final DateTime updateTime;
  final DateTime deletedTime;
  final String contents;

  ChatItem({
    this.writer,
    this.createdTime,
    this.updateTime,
    this.deletedTime,
    this.contents,
  });
}
