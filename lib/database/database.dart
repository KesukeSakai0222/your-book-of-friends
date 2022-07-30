import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../model/event.dart';
import '../model/friend.dart';
import '../model/name.dart';
import '../model/tag.dart';
import '../model/friend_tag.dart';
part 'database.g.dart';

@DriftDatabase(tables: [Friends, Names, Events, Tags, FriendTags])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Friend Operation
  // Stream<List<Friend>> watchFriends() => select(friends).watch();
  // Future insFriend(Friend f) {
  //   return into(friends).insert(f);
  // }
  // Future<List<Name>>
  // Stream<List<Tag>> watchTags() => select(tags).watch();

}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
