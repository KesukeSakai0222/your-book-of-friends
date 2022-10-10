import 'dart:async';

import 'package:collection/collection.dart';
import 'package:your_book_of_friends/dao/my_database.dart';
import 'package:your_book_of_friends/model/friend.dart' as f;
import 'package:your_book_of_friends/model/event.dart' as e;
import 'package:your_book_of_friends/model/name.dart' as n;
import 'package:your_book_of_friends/model/tag.dart' as t;

const coreSqlColumns = """
      select
        f.id          as friend_id
      , f.main_name   as main_name
      , f.last_date   as last_date
      , f.birthday    as birthday
      , f.memo        as memo
      , f.is_notify   as is_notify
      , f.address     as address
      , f.occupation  as occupation
      , n.id          as name_id
      , n.name        as name
      , t.id          as tag_id
      , t.name        as tag_name
      , t.color       as color
      """;
const coreSqlBody = """
      left join
        names n
      on
        f.id = n.friend_id
      left join
        friend_tags ft
      on
        f.id = ft.friend_id
      left join
        tags t
      on
        ft.tag_id = t.id
      """;

class FriendsDao {
  final MyDatabase _myDatabase;

  FriendsDao(this._myDatabase);

  Future<List<f.Friend>> readAll() async {
    final result = _myDatabase.db.then((db) => db.rawQuery("""
      $coreSqlColumns
      from
        friends f
      $coreSqlBody"""));

    final grouped = result
        .then((values) => groupBy(values, (p0) => p0['friend_id'] as int));
    return grouped.then((values) =>
        values.entries.map((value) => f.Friend.fromMap(value.value)).toList());
  }

  Future<f.Friend> read(int id) async {
    final result = _myDatabase.db.then((db) => db.rawQuery("""
      $coreSqlColumns
      from
        friend f
      $coreSqlBody
      where
        f.id = ?1""", [id]));
    return result.then((value) => f.Friend.fromMap(value));
  }

  Future<List<f.Friend>> search(String v) async {
    final result = _myDatabase.db.then((db) => db.rawQuery("""
      $coreSqlColumns
      from
        names nd
      inner join
        friends f
      on
        f.id = nd.friend_id
      $coreSqlBody
      where
        nd.name like ?1""", ["$v%"]));
    final grouped = result
        .then((values) => groupBy(values, (p0) => p0['friend_id'] as int));
    return grouped.then((values) =>
        values.entries.map((value) => f.Friend.fromMap(value.value)).toList());
  }

  Future add(f.Friend friend) {
    return _myDatabase.db.then((db) {
      db.transaction((txn) async {
        final id = await txn.insert(f.tableName, friend.toMap());

        final batch = txn.batch();
        for (var name in friend.names) {
          batch.insert(n.tableName, name.setFriendId(id).toMap());
        }
        for (var tag in friend.tags) {
          batch.insert(t.tableName, tag.toFriendTagsMap(id));
        }
        await batch.commit(noResult: true);
      });
    });
  }

  Future delete(int id) {
    return _myDatabase.db.then((db) {
      db.transaction((txn) async {
        final batch = txn.batch();
        batch.delete(n.tableName, where: 'friend_id = ?', whereArgs: [id]);
        batch.delete(e.tableName, where: 'friend_id = ?', whereArgs: [id]);
        batch.delete(t.joinTableName, where: 'friend_id = ?', whereArgs: [id]);
        batch.delete(f.tableName, where: 'id = ?', whereArgs: [id]);
        await batch.commit(noResult: true);
      });
    });
  }

  Future update(f.Friend friend) {
    if (friend.id == null) {
      throw ArgumentError('idを設定してください');
    }
    return _myDatabase.db.then((db) async {
      await db.update(f.tableName, friend.toMap(),
          where: 'id = ?', whereArgs: [friend.id]);
    });
  }
}
