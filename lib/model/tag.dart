const String tableName = 'tags';
const String joinTableName = 'friend_tags';
const String columnId = 'id';
const String columnFriendId = 'friend_id';
const String columnTagId = 'tag_id';
const String columnName = 'name';
const String columnTagName = 'tag_name';
const String columnColor = 'color';

class Tag {
  late final int? id;
  late final String name;
  late final String color;

  Tag(this.id, this.name, this.color);
  Tag.init(this.name, this.color);

  Tag.fromMap(Map<String, Object?> map) {
    id = map[columnId] as int? ?? map[columnTagId] as int;
    name = map[columnName] as String? ?? map[columnTagName] as String;
    color = map[columnColor] as String;
  }

  Map<String, Object?> toMap() {
    final map = <String, Object?>{
      columnName: name,
      columnColor: color,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Map<String, Object?> toFriendTagsMap(final int friendId) {
    return <String, Object?>{columnFriendId: friendId, columnTagId: id};
  }

  @override
  bool operator ==(Object other) {
    if (other is Tag) {
      return id == other.id;
    }
    return false;
  }

  @override
  int get hashCode => id.hashCode;
}
