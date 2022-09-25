const String tableName = 'friends';
const String columnId = 'id';
const String columnFriendId = 'friend_id';
const String columnName = 'name';
const String columnIsMain = 'is_main';

class Name {
  late final int? id;
  late final int? friendId;
  late final String name;
  late final bool isMain;

  Name(this.id, this.friendId, this.name, this.isMain);
  Name.init(this.name, this.isMain)
      : id = null,
        friendId = null;

  Name.fromMap(final Map<String, Object?> map) {
    id = map[columnId] as int;
    friendId = map[columnFriendId] as int;
    name = map[columnName] as String;
    isMain = map[columnIsMain] as bool;
  }

  Name setFriendId(int friendId) {
    return Name(id, friendId, name, isMain);
  }

  Map<String, Object?> toMap() {
    final map = <String, Object?>{columnName: name, columnIsMain: isMain};
    if (id != null) {
      map[columnId] = id;
    }
    if (friendId == null) {
      throw ArgumentError("friend idを設定してください");
    }
    map[columnFriendId] = friendId;
    return map;
  }
}
