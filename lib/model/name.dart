import 'package:drift/drift.dart';
import 'package:your_book_of_friends/database/database.dart';

import 'friend.dart';

class Name implements Insertable<Name> {
  late int? id;
  late int friendId;
  String name;
  bool isMain;

  Name(this.id, this.friendId, this.name, this.isMain);
  Name.init(this.name, this.isMain);
  Name.initWithFriendId(this.friendId, this.name, this.isMain);

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return NamesCompanion(
            friendId: Value(friendId), name: Value(name), isMain: Value(isMain))
        .toColumns(nullToAbsent);
  }

  Name setFriendId(int friendId) {
    return Name.initWithFriendId(friendId, name, isMain);
  }
}

@UseRowClass(Name)
class Names extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get friendId =>
      integer().customConstraint('NOT NULL REFERENCES friends(id)')();
  TextColumn get name => text()();
  BoolColumn get isMain => boolean().withDefault(const Constant(false))();
}
