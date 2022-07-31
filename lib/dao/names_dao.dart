import 'package:drift/drift.dart';
import 'package:your_book_of_friends/database/database.dart';
import 'package:your_book_of_friends/model/name.dart';

part 'names_dao.g.dart';

@DriftAccessor(tables: [Names])
class NamesDao extends DatabaseAccessor<MyDatabase> with _$NamesDaoMixin {
  NamesDao(super.attachedDatabase);
}
