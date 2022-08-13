import 'package:drift/drift.dart';
import 'package:your_book_of_friends/database/database.dart';
import 'package:your_book_of_friends/model/event.dart';
import 'package:your_book_of_friends/model/name.dart';
import 'package:your_book_of_friends/model/tag.dart';

class Friend implements Insertable<Friend> {
  late final int? id;
  late final List<Name> names;
  late final List<Event> events;
  late final List<Tag> tags;
  final String? memo;
  final DateTime? birthday;
  final bool isNotify;
  final String? address;
  final String? occupation;

  // コンストラクタ
  Friend(this.id, this.memo, this.birthday, this.isNotify, this.address,
      this.occupation) {
    names = <Name>[];
    events = <Event>[];
    tags = <Tag>[];
  }

  // 新規作成
  Friend.init(this.names, this.tags, this.memo, this.birthday, this.isNotify,
      this.address, this.occupation) {
    events = <Event>[];
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return FriendsCompanion(
            memo: Value(memo),
            birthday: Value(birthday),
            isNotify: Value(isNotify),
            address: Value(address),
            occupation: Value(occupation))
        .toColumns(nullToAbsent);
  }
}

class FriendWithMainName {
  final Friend friend;
  final Name mainName;

  FriendWithMainName(this.friend, this.mainName);
}

@UseRowClass(Friend)
class Friends extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get memo => text().nullable()();
  DateTimeColumn get birthday => dateTime().nullable()();
  BoolColumn get isNotify => boolean().withDefault(const Constant(false))();
  TextColumn get address => text().nullable()();
  TextColumn get occupation => text().nullable()();
}
