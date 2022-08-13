import 'dart:async';

import 'package:your_book_of_friends/model/friend.dart';
import 'package:your_book_of_friends/model/name.dart';
import 'package:your_book_of_friends/model/tag.dart';
import 'package:your_book_of_friends/repository/friend_repository.dart';

class FriendBloc {
  final _friendRepo = FriendRepository();
  final _friendController =
      StreamController<List<FriendWithMainName>>.broadcast();

  get friends => _friendController.stream;

  FriendBloc() {
    getFriends();
  }

  getFriends() async =>
      _friendController.sink.add(await _friendRepo.getAllFriends());

  addFriend(Friend f) async {
    _friendRepo.addFriend(f);
    getFriends();
  }
}
