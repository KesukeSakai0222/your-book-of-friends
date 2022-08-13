import 'package:drift/drift.dart';
import 'package:your_book_of_friends/database/database.dart';
import 'package:your_book_of_friends/model/friend.dart';
import 'package:your_book_of_friends/model/name.dart';
import 'package:your_book_of_friends/model/tag.dart';

part 'tags_dao.g.dart';

@DriftAccessor(tables: [Tags, Friends, Names])
class TagsDao extends DatabaseAccessor<MyDatabase> with _$TagsDaoMixin {
  TagsDao(super.attachedDatabase);
}
