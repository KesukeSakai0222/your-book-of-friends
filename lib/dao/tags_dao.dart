import 'package:your_book_of_friends/model/tag.dart';

import 'my_database.dart';

class TagsDao {
  final MyDatabase _myDatabase;

  TagsDao(this._myDatabase);

  Future<List<Tag>> readAll() async {
    final objs = _myDatabase.db.then((db) => db.query(tableName));
    return objs.then((value) => value.map((e) => Tag.fromMap(e)).toList());
  }

  Future<List<Tag>> search(String v) async {
    final objs = _myDatabase.db.then(
        (db) => db.query(tableName, where: 'name like ?%', whereArgs: [v]));
    return objs.then((value) => value.map((e) => Tag.fromMap(e)).toList());
  }

  Future add(Tag t) {
    return _myDatabase.db.then((db) {
      db.insert(tableName, t.toMap());
    });
  }

  Future delete(int id) {
    return _myDatabase.db.then((db) => db.transaction((txn) async {
          txn.delete(joinTableName, where: 'tag_id = ?', whereArgs: [id]);
          txn.delete(tableName, where: 'id = ?', whereArgs: [id]);
        }));
  }

  Future update(Tag t) {
    return _myDatabase.db.then((db) =>
        db.update(tableName, t.toMap(), where: 'id = ?', whereArgs: [t.id]));
  }
}
