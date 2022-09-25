import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:your_book_of_friends/bloc/friend_bloc.dart';
import 'package:your_book_of_friends/dao/my_database.dart';
import 'package:your_book_of_friends/model/friend.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({super.key});

  @override
  State<StatefulWidget> createState() => FriendPageState();
}

class FriendPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FriendBloc(Provider.of<MyDatabase>(context)).getFriends(),
        builder: (context, AsyncSnapshot<List<Friend>> snapshot) {
          return friendCards(snapshot);
        });
  }
}

Widget friendCards(AsyncSnapshot<List<Friend>> snapshot) {
  return snapshot.hasData && snapshot.data!.isNotEmpty
      ? ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: ((context, index) {
            final f = snapshot.data![index];
            final card = Dismissible(
              background: Container(
                color: Colors.redAccent,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.delete,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              key: ObjectKey(f),
              child: Card(
                color: Colors.white,
                child: Text(f.mainName),
              ),
              onDismissed: (direction) {
                FriendBloc(Provider.of<MyDatabase>(context))
                    .deleteFriend(f.id!);
              },
            );
            return card;
          }),
        )
      : ListView();
}
