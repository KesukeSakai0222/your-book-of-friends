import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:your_book_of_friends/model/friend.dart';
import 'package:your_book_of_friends/model/name.dart';
import 'package:your_book_of_friends/model/event.dart';
import 'package:your_book_of_friends/model/tag.dart';
import 'package:your_book_of_friends/model/friend_tag.dart';
import 'package:your_book_of_friends/dao/friends_dao.dart';
import 'package:your_book_of_friends/dao/events_dao.dart';
import 'package:your_book_of_friends/dao/tags_dao.dart';
part 'database.g.dart';

@DriftDatabase(
    tables: [Friends, Names, Events, Tags, FriendTags],
    daos: [FriendsDao, EventsDao, TagsDao])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
