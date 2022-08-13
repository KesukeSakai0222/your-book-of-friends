import 'package:drift/drift.dart';
import 'package:your_book_of_friends/database/database.dart';
import 'package:your_book_of_friends/model/event.dart';
import 'package:your_book_of_friends/model/friend.dart';
import 'package:your_book_of_friends/model/name.dart';

part 'events_dao.g.dart';

@DriftAccessor(tables: [Events, Friends, Names])
class EventsDao extends DatabaseAccessor<MyDatabase> with _$EventsDaoMixin {
  EventsDao(super.attachedDatabase);
}
