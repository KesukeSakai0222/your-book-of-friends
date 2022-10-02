import 'dart:async';

import 'package:your_book_of_friends/dao/my_database.dart';
import 'package:your_book_of_friends/model/friend.dart';
import 'package:your_book_of_friends/repository/friend_repository.dart';

class FriendBloc {
  late FriendRepository _friendRepo;
  final _friendController = StreamController<List<Friend>>.broadcast();

  FriendBloc(MyDatabase db) {
    _friendRepo = FriendRepository(db);
    getFriends();
  }

  get friendStream => _friendController.stream;

  getFriends() async =>
      _friendController.sink.add(await _friendRepo.getAllFriends());

  searchFriends(String v) async =>
      _friendController.sink.add(await _friendRepo.searchFriends(v));

  addFriend(Friend f) async {
    await _friendRepo.addFriend(f);
    getFriends();
  }

  deleteFriend(int id) async {
    await _friendRepo.deleteFriend(id);
    getFriends();
  }

  updateFriend(Friend f) async {
    await _friendRepo.updateFriend(f);
    getFriends();
  }

  dispose() {
    _friendController.close();
  }
}
