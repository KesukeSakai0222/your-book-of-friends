import 'package:drift/drift.dart';

class FriendTag {
  late int? id;
  final int friendId;
  final int tagId;

  FriendTag(this.id, this.friendId, this.tagId);
  FriendTag.init(this.friendId, this.tagId);
}

@UseRowClass(FriendTag)
class FriendTags extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get friendId =>
      integer().customConstraint('NOT NULL REFERENCES friends(id)')();
  IntColumn get tagId =>
      integer().customConstraint('NOT NULL REFERENCES tags(id)')();
}
