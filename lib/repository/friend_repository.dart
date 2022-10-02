import 'dart:async';
import 'dart:core';

import 'package:your_book_of_friends/dao/my_database.dart';
import 'package:your_book_of_friends/dao/friends_dao.dart';
import 'package:your_book_of_friends/model/friend.dart';

class FriendRepository {
  late FriendsDao _friendsDao;
  final _friendController = StreamController.broadcast();

  get friendStream => _friendController.stream;

  FriendRepository(MyDatabase db) {
    _friendsDao = FriendsDao(db);
  }

  Future<List<Friend>> getAllFriends() => _friendsDao.readAll();
  Future<List<Friend>> searchFriends(String v) => _friendsDao.search(v);
  Future<Friend> getFriend(int id) => _friendsDao.read(id);
  Future addFriend(Friend f) => _friendsDao.add(f);
  Future updateFriend(Friend f) => _friendsDao.update(f);
  Future deleteFriend(int id) => _friendsDao.delete(id);
}
