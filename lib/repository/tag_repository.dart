import 'dart:async';

import 'package:your_book_of_friends/dao/my_database.dart';
import 'package:your_book_of_friends/dao/tags_dao.dart';
import 'package:your_book_of_friends/model/tag.dart';

class TagRepository {
  late TagsDao _tagsDao;
  final _tagController = StreamController.broadcast();

  get tagStream => _tagController.stream;

  TagRepository(MyDatabase db) {
    _tagsDao = TagsDao(db);
  }

  Future<List<Tag>> getAllTags() => _tagsDao.readAll();
  Future<List<Tag>> search(String v) => _tagsDao.search(v);
  Future addTag(Tag t) => _tagsDao.add(t);
  Future deleteTag(int id) => _tagsDao.delete(id);
  Future updateTag(Tag t) => _tagsDao.update(t);
}
