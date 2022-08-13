import 'package:drift/drift.dart';
import 'package:your_book_of_friends/database/database.dart';
import 'package:your_book_of_friends/model/tag.dart';

class FriendTag implements Insertable<FriendTag> {
  late int? id;
  final int friendId;
  late final int tagId;

  FriendTag(this.id, this.friendId, this.tagId);
  FriendTag.init(this.friendId, this.tagId);

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return FriendTagsCompanion(friendId: Value(friendId), tagId: Value(tagId))
        .toColumns(nullToAbsent);
  }
}

@UseRowClass(FriendTag)
class FriendTags extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get friendId =>
      integer().customConstraint('NOT NULL REFERENCES friends(id)')();
  IntColumn get tagId =>
      integer().customConstraint('NOT NULL REFERENCES tags(id)')();
}
