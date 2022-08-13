import 'package:your_book_of_friends/dao/friends_dao.dart';
import 'package:your_book_of_friends/database/database.dart';
import 'package:your_book_of_friends/model/friend.dart';
import 'package:your_book_of_friends/model/name.dart';
import 'package:your_book_of_friends/model/tag.dart';

class FriendRepository {
  final friendsDao = FriendsDao(MyDatabase());

  Future<List<FriendWithMainName>> getAllFriends() => friendsDao.watchAll();
  Future addFriend(Friend f) => friendsDao.add(f);
}
