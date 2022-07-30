import 'package:drift/drift.dart';

import 'friend.dart';

class Name {
  late int? id;
  int friendId;
  String name;
  bool isMain;

  Name(this.id, this.friendId, this.name, this.isMain);
  Name.init(this.friendId, this.name, this.isMain);
}

@UseRowClass(Name)
class Names extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get friendId =>
      integer().customConstraint('NOT NULL REFERENCES friends(id)')();
  TextColumn get name => text()();
  BoolColumn get isMain => boolean().withDefault(const Constant(false))();
}
