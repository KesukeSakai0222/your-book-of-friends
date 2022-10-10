import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:your_book_of_friends/bloc/friend_bloc.dart';
import 'package:your_book_of_friends/bloc/tag_bloc.dart';
import 'package:your_book_of_friends/model/selected_index.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<StatefulWidget> createState() => BottomBarState();
}

class BottomBarState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = Provider.of<SelectedIndex>(context);
    final friendBloc = Provider.of<FriendBloc>(context);
    final tagBloc = Provider.of<TagBloc>(context);
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.people),
          label: AppLocalizations.of(context)!.friend,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.event),
          label: AppLocalizations.of(context)!.event,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.label),
          label: AppLocalizations.of(context)!.tag,
        )
      ],
      currentIndex: selectedIndex.index,
      onTap: (int index) {
        selectedIndex.setIndex(index);
        switch (index) {
          case 0:
            friendBloc.getFriends();
            break;
          case 1:
            break;
          case 2:
            tagBloc.getTags();
            break;
        }
      },
    );
  }
}
