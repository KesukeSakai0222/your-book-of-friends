import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:your_book_of_friends/bloc/friend_bloc.dart';
import 'package:your_book_of_friends/model/friend.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({super.key});

  @override
  State<StatefulWidget> createState() => FriendPageState();
}

class FriendPageState extends State<FriendPage> {
  @override
  Widget build(final BuildContext context) {
    final bloc = Provider.of<FriendBloc>(context, listen: false);
    return StreamBuilder(
        stream: bloc.friendStream,
        builder: ((BuildContext context, AsyncSnapshot<List<Friend>> snapshot) {
          return snapshot.hasData && snapshot.data!.isNotEmpty
              ? SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final f = snapshot.data![index];
                    return friendCard(context, f);
                  }, childCount: snapshot.data!.length),
                )
              : const SliverToBoxAdapter();
        }));
  }
}

Widget friendCard(BuildContext context, Friend f) {
  return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
            child: Text(
          f.mainName.substring(0, 1),
          style: const TextStyle(color: Colors.white),
        )),
        title: Text(f.mainName),
      ));
}
