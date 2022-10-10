import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// データベース接続@シングルトン
class MyDatabase {
  late final Future<Database> db;

  static final MyDatabase _instance = MyDatabase._init();

  factory MyDatabase() {
    return _instance;
  }

  MyDatabase._init() {
    db = openDb();
  }

  close() async {
    db.then((d) => d.close());
  }

  Future<Database> openDb() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'your_book_of_driends.db'),
      version: 2,
      onCreate: ((db, version) async {
        await db.execute(
          """
        create table friends(
          id integer primary key autoincrement,
          main_name text not null,
          last_date text,
          birthday text,
          memo text,
          is_notify boolean not null,
          address text,
          occupation text)
        """,
        );
        await db.execute(
          """
        create table tags(
          id integer primary key autoincrement,
          name text not null,
          color integer not null)
        """,
        );
        await db.execute(
          """
        create table names(
          id integer primary key autoincrement,
          friend_id integer not null,
          name text not null,
          is_main boolean not null,
          foreign key(friend_id) references friends(id))
        """,
        );
        await db.execute(
          """
        create table events(
          id integer primary key autoincrement,
          friend_id integer not null,
          name text not null,
          date text not null,
          memo text not null,
          amount integer not null,
          foreign key(friend_id) references friends(id))
        """,
        );
        await db.execute(
          """
        create table friend_tags(
          id integer primary key autoincrement,
          friend_id integer not null,
          tag_id integer not null,
          foreign key(friend_id) references friends(id),
          foreign key(tag_id) references tags(id))
        """,
        );
      }),
      onUpgrade: (db, oldVersion, newVersion) async {
        await db.execute("drop table tags");
        await db.execute(
          """
        create table tags(
          id integer primary key autoincrement,
          name text not null,
          color integer not null)
        """,
        );
      },
    );
  }
}
