import 'package:drift/drift.dart';
import 'package:your_book_of_friends/database/database.dart';
import 'package:your_book_of_friends/model/friend_tag.dart';

part 'friend_tags_dao.g.dart';

@DriftAccessor(tables: [FriendTags])
class FriendTagsDao extends DatabaseAccessor<MyDatabase>
    with _$FriendTagsDaoMixin {
  FriendTagsDao(super.attachedDatabase);
}
