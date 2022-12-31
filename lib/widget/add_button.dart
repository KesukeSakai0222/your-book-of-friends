import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_book_of_friends/bloc/friend_bloc.dart';
import 'package:your_book_of_friends/bloc/tag_bloc.dart';
import 'package:your_book_of_friends/dao/my_database.dart';
import 'package:your_book_of_friends/model/selected_index.dart';
import 'package:your_book_of_friends/widget/friend_detail.dart';
import 'package:your_book_of_friends/widget/tag_detail.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key});

  @override
  State<StatefulWidget> createState() => AddButtonState();
}

class AddButtonState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final index = Provider.of<SelectedIndex>(context).index;
    final friendBloc = Provider.of<FriendBloc>(context);
    final tagBloc = Provider.of<TagBloc>(context);
    final db = Provider.of<MyDatabase>(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        switch (index) {
          case 0:
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MultiProvider(
                      providers: [
                        Provider(create: (context) => friendBloc),
                        Provider(create: (context) => db),
                      ],
                      child: const FriendAdd(),
                    )));
            break;
          case 1:
            break;
          case 2:
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Provider(
                      create: (context) => tagBloc,
                      child: const TagAdd(),
                    )));
            break;
        }
      },
    );
  }
}
