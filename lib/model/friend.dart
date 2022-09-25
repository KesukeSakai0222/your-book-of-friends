import 'event.dart';
import 'name.dart';
import 'tag.dart';

const String tableName = 'friends';
const String columnId = 'id';
const String columnMainName = 'main_name';
const String columnLastDay = 'lastDay';
const String columnMemo = 'memo';
const String columnBirthday = 'birthday';
const String columnIsNotify = 'is_notify';
const String columnAddress = 'address';
const String columnOccupation = 'occupation';

class Friend {
  final int? id;
  final String mainName;
  final DateTime? lastDay;
  final String? memo;
  final DateTime? birthday;
  final bool isNotify;
  final String? address;
  final String? occupation;
  final List<Name> names;
  final List<Event> events;
  final List<Tag> tags;

  // コンストラクタ
  Friend(
      {this.id,
      required this.mainName,
      this.lastDay,
      this.memo,
      this.birthday,
      required this.isNotify,
      this.address,
      this.occupation,
      required this.names,
      required this.events,
      required this.tags});

  // レコードからの取得
  Friend.fromMap(final Map<String, Object?> record)
      : id = record[columnId] as int,
        mainName = record[columnMainName] as String,
        lastDay = record[columnLastDay] as DateTime,
        memo = record[columnMemo] as String,
        birthday = record[columnBirthday] as DateTime,
        isNotify = record[columnIsNotify] as bool,
        address = record[columnAddress] as String,
        occupation = record[columnOccupation] as String,
        names = [],
        events = [],
        tags = [];

  // 新規作成
  Friend.init(
      {required this.mainName,
      this.lastDay,
      this.memo,
      this.birthday,
      required this.isNotify,
      this.address,
      this.occupation,
      required this.names,
      required this.tags})
      : id = null,
        events = [];

  Map<String, Object?> toMap() {
    final map = <String, Object?>{
      columnMainName: mainName,
      columnLastDay: lastDay,
      columnMemo: memo,
      columnBirthday: birthday,
      columnIsNotify: isNotify,
      columnAddress: address,
      columnOccupation: occupation,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  List<Map<String, Object?>> eventsToMap() {
    return events.map((event) => event.toMap()).toList();
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
}
