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
  final String? location;

  // コンストラクタ
  Friend(this.id, this.memo, this.birthday, this.isNotify, this.location) {
    names = <Name>[];
    events = <Event>[];
    tags = <Tag>[];
  }

  // 新規作成
  Friend.init(String name, this.tags, this.memo, this.birthday, this.isNotify,
      this.location) {
    names = <Name>[];
    names.add(Name.init(id!, name, true));
    events = <Event>[];
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return FriendsCompanion(
            memo: Value(memo),
            birthday: Value(birthday),
            isNotify: Value(isNotify),
            location: Value(location))
        .toColumns(nullToAbsent);
  }
}

@UseRowClass(Friend)
class Friends extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get memo => text().nullable()();
  DateTimeColumn get birthday => dateTime().nullable()();
  BoolColumn get isNotify => boolean().withDefault(const Constant(false))();
  TextColumn get location => text().nullable()();
}
