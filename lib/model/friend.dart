import 'name.dart';
import 'tag.dart';

const String tableName = 'friends';
const String columnId = 'id';
const String columnMainName = 'main_name';
const String columnLastDate = 'last_date';
const String columnMemo = 'memo';
const String columnBirthday = 'birthday';
const String columnIsNotify = 'is_notify';
const String columnAddress = 'address';
const String columnOccupation = 'occupation';
const String columnFriendId = 'friend_id';

class Friend {
  late final int? id;
  late final String mainName;
  late final DateTime? lastDate;
  late final String? memo;
  late final DateTime? birthday;
  late final bool isNotify;
  late final String? address;
  late final String? occupation;
  late final List<Name> names;
  late final List<Tag> tags;

  // コンストラクタ
  Friend(
      {this.id,
      required this.mainName,
      this.lastDate,
      this.memo,
      this.birthday,
      required this.isNotify,
      this.address,
      this.occupation,
      required this.names,
      required this.tags});

  // レコードからの取得
  Friend.fromMap(final List<Map<String, Object?>> records) {
    id = records[0][columnFriendId] as int;
    mainName = records[0][columnMainName] as String;
    lastDate = records[0][columnLastDate] != null
        ? DateTime.parse(records[0][columnLastDate] as String)
        : null;
    memo = records[0][columnMemo] as String?;
    birthday = records[0][columnBirthday] != null
        ? DateTime.parse(records[0][columnBirthday] as String)
        : null;
    isNotify = records[0][columnIsNotify] == 0 ? false : true;
    address = records[0][columnAddress] as String?;
    occupation = records[0][columnOccupation] as String?;
    final namesSet = <Name>{};
    final tagsSet = <Tag>{};
    for (final record in records) {
      if (record[columnNameId] != null) {
        namesSet.add(Name.fromMap(record));
      }
      if (record[columnTagId] != null) {
        tagsSet.add(Tag.fromMap(record));
      }
    }
    names = namesSet.toList();
    tags = tagsSet.toList();
  }

  // 新規作成
  Friend.init(
      {required this.mainName,
      this.lastDate,
      this.memo,
      this.birthday,
      required this.isNotify,
      this.address,
      this.occupation,
      required this.names,
      required this.tags})
      : id = null;

  Map<String, Object?> toMap() {
    final map = <String, Object?>{
      columnMainName: mainName,
      columnLastDate: lastDate,
      columnMemo: memo,
      columnBirthday: birthday.toString(),
      columnIsNotify: isNotify ? 1 : 0,
      columnAddress: address,
      columnOccupation: occupation,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  List<Map<String, Object?>> namesToMap() {
    return names.map((name) => name.toMap()).toList();
  }

  List<Map<String, Object?>> tagsToFriendTagsMap() {
    if (id == null) {
      throw ArgumentError("idを設定してください");
    }
    return tags.map((tag) => tag.toFriendTagsMap(id!)).toList();
  }

  @override
  bool operator ==(Object other) {
    if (other is Friend) {
      return id == other.id;
    }
    return false;
  }

  @override
  int get hashCode => id.hashCode;
}
