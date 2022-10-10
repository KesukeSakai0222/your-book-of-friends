const String tableName = 'names';
const String columnId = 'id';
const String columnFriendId = 'friend_id';
const String columnName = 'name';
const String columnIsMain = "is_main";
const String columnNameId = 'name_id';

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
    id = map[columnNameId] as int? ?? map[columnId] as int;
    friendId = map[columnFriendId] as int;
    name = map[columnName] as String;
    isMain = map[columnIsMain] == '1' ? true : false;
  }

  Name setFriendId(int friendId) {
    return Name(id, friendId, name, isMain);
  }

  Map<String, Object?> toMap() {
    final map = <String, Object?>{
      columnName: name,
      columnIsMain: isMain ? 1 : 0
    };
    if (id != null) {
      map[columnId] = id;
    }
    if (friendId == null) {
      throw ArgumentError("friend idを設定してください");
    }
    map[columnFriendId] = friendId;
    return map;
  }

  @override
  bool operator ==(Object other) {
    if (other is Name) {
      return id == other.id;
    }
    return false;
  }

  @override
  int get hashCode => id.hashCode;
}
