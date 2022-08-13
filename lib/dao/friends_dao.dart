import 'package:drift/drift.dart';
import 'package:your_book_of_friends/database/database.dart';
import 'package:your_book_of_friends/model/event.dart';
import 'package:your_book_of_friends/model/friend.dart';
import 'package:your_book_of_friends/model/friend_tag.dart';
import 'package:your_book_of_friends/model/name.dart';
import 'package:your_book_of_friends/model/tag.dart';

part 'friends_dao.g.dart';

@DriftAccessor(tables: [Friends, Names, Events, FriendTags])
class FriendsDao extends DatabaseAccessor<MyDatabase> with _$FriendsDaoMixin {
  FriendsDao(super.attachedDatabase);

  Future<List<FriendWithMainName>> watchAll() async {
    final query = select(friends).join([
      innerJoin(names, names.friendId.equalsExp(friends.id)),
    ])
      ..where(names.isMain.equals(true));
    final result = await query.get();

    return result.map((row) {
      return FriendWithMainName(row.readTable(friends), row.readTable(names));
    }).toList();
  }

  // Stream<List<Friend>> watchAllSortByLastDay() {
  //   return (select(friends)..orderBy([(t) => OrderingTerm(expression: t.)])).watch();
  // }

  Future add(Friend f) async {
    final id = into(friends).insert(f);
    id.then((i) {
      for (var n in f.names) {
        into(names).insert(n.setFriendId(i));
      }
      for (var t in f.tags) {
        into(friendTags).insert(FriendTag.init(i, t.id));
      }
    });
  }

  Future del(Friend f) {
    return (delete(friends)..where((t) => t.id.equals(f.id))).go();
  }

  Future upd(Friend f) {
    return (update(friends)..where((t) => t.id.equals(f.id))).write(f);
  }
}
