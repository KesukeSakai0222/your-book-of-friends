import 'package:drift/drift.dart';

class Event {
  late final int id;
  final int friendId;
  final String name;
  final DateTime date;
  final String? memo;
  final int amount;

  Event(this.id, this.friendId, this.name, this.date, this.memo, this.amount);
  Event.init(this.friendId, this.name, this.date, this.memo, this.amount);
}

@UseRowClass(Event)
class Events extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get friendId =>
      integer().customConstraint('NOT NULL REFERENCES friends(id)')();
  TextColumn get name => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get memo => text().nullable()();
  IntColumn get amount => integer()();
}
