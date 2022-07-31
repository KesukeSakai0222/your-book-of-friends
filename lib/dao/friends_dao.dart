import 'package:drift/drift.dart';
import 'package:your_book_of_friends/database/database.dart';
import 'package:your_book_of_friends/model/friend.dart';

part 'friends_dao.g.dart';

@DriftAccessor(tables: [Friends])
class FriendsDao extends DatabaseAccessor<MyDatabase> with _$FriendsDaoMixin {
  FriendsDao(super.attachedDatabase);
}
