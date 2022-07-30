import 'package:drift/drift.dart';

class Tag {
  late final int id;
  String name;
  String color;

  Tag(this.id, this.name, this.color);
  Tag.init(this.name, this.color) {}
}

@UseRowClass(Tag)
class Tags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get color => text()();
}
