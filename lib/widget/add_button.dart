import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_book_of_friends/widget/app.dart';
import 'package:your_book_of_friends/widget/friend_detail.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key});

  @override
  State<StatefulWidget> createState() => AddButtonState();
}

class AddButtonState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    var index = Provider.of<SelectedIndex>(context).index;
    return Visibility(
        visible: index == 2 ? false : true,
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            switch (index) {
              case 0:
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const FriendAdd()));
                break;
              case 1:
                break;
              case 2:
                break;
            }
          },
        ));
  }
}
