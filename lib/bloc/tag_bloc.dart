import 'dart:async';

import 'package:your_book_of_friends/dao/my_database.dart';
import 'package:your_book_of_friends/model/tag.dart';
import 'package:your_book_of_friends/repository/tag_repository.dart';

class TagBloc {
  late TagRepository _tagRepo;
  final _tagController = StreamController<List<Tag>>.broadcast();

  TagBloc(MyDatabase db) {
    _tagRepo = TagRepository(db);
  }

  get tagStream => _tagController.stream;

  getTags() async => _tagController.sink.add(await _tagRepo.getAllTags());

  searchTags(String v) async =>
      _tagController.sink.add(await _tagRepo.search(v));

  addTag(Tag t) {
    _tagRepo.addTag(t);
    getTags();
  }

  deleteTag(int id) {
    _tagRepo.deleteTag(id);
    getTags();
  }

  updateTag(Tag t) {
    _tagRepo.updateTag(t);
    getTags();
  }

  dispose() => _tagController.close();
}
