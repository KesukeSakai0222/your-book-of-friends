import 'dart:async';

import 'package:your_book_of_friends/dao/my_database.dart';
import 'package:your_book_of_friends/model/friend.dart' as f;
import 'package:your_book_of_friends/model/event.dart' as e;
import 'package:your_book_of_friends/model/name.dart' as n;
import 'package:your_book_of_friends/model/tag.dart' as t;

class FriendsDao {
  final MyDatabase _myDatabase;

  FriendsDao(this._myDatabase);

  Future<List<f.Friend>> readAll() async {
    final result = _myDatabase.db.then((db) => db.query(f.tableName));

    return result.then((records) =>
        records.map((record) => f.Friend.fromMap(record)).toList());
  }

  Future<f.Friend> read(int id) async {
    final result = await _myDatabase.db.then((db) =>
        db.query(f.tableName, where: 'id = ?', whereArgs: [id], limit: 1));
    return f.Friend.fromMap(result[0]);
  }

  Future add(f.Friend friend) {
    return _myDatabase.db.then((db) {
      db.transaction((txn) async {
        final id = await txn.insert(f.tableName, friend.toMap());

        final batch = txn.batch();
        for (var name in friend.names) {
          batch.insert(n.tableName, name.setFriendId(id).toMap());
        }
        for (final event in friend.events) {
          batch.insert(e.tableName, event.setFriendId(id).toMap());
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
