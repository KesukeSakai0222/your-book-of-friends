const String tableName = 'events';
const String columnId = 'id';
const String columnFriendId = 'friend_id';
const String columnName = 'name';
const String columnDate = 'date';
const String columnMemo = 'memo';
const String columnAmount = 'amount';

class Event {
  late final int? id;
  late final int? friendId;
  late final String name;
  late final DateTime date;
  late final String? memo;
  late final int amount;

  Event(this.id, this.friendId, this.name, this.date, this.memo, this.amount);
  Event.init(this.friendId, this.name, this.date, this.memo, this.amount);

  Event.fromMap(Map<String, Object?> map) {
    id = map['id'] as int;
    friendId = map['friendId'] as int;
    name = map['name'] as String;
    date = map['date'] as DateTime;
    memo = map['memo'] as String;
    amount = map['amount'] as int;
  }

  Event setFriendId(int friendId) {
    return Event(id, friendId, name, date, memo, amount);
  }

  Map<String, Object?> toMap() {
    final map = <String, Object?>{
      columnName: name,
      columnDate: date,
      columnMemo: memo,
      columnAmount: amount,
    };
    if (id != null) {
      map[columnId] = id;
    }
    if (friendId == null) {
      throw ArgumentError('friend idを設定してください');
    }
    map[columnFriendId] = friendId;
    return map;
  }
}
