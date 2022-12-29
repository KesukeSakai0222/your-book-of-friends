import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:your_book_of_friends/bloc/friend_bloc.dart';
import 'package:your_book_of_friends/bloc/tag_bloc.dart';
import 'package:your_book_of_friends/model/selected_index.dart';

class AppBar extends StatefulWidget {
  const AppBar({super.key});

  @override
  State<StatefulWidget> createState() => AppBarState();
}

class AppBarState extends State<StatefulWidget> {
  bool _isSearchMode = false;
  @override
  Widget build(BuildContext context) {
    var index = Provider.of<SelectedIndex>(context).index;
    final _friendBloc = Provider.of<FriendBloc>(context);
    final _tagBloc = Provider.of<TagBloc>(context);
    return SliverAppBar(
        title: _isSearchMode
            ? TextField(
                autofocus: true,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  switch (index) {
                    case 0:
                      _friendBloc.searchFriends(value);
                      break;
                    case 1:
                      break;
                    case 2:
                      _tagBloc.getTags();
                      break;
                  }
                },
              )
            : Text(AppLocalizations.of(context)!.title,
                style: GoogleFonts.hinaMincho(fontWeight: FontWeight.bold)),
        floating: true,
        centerTitle: true,
        actions: [
          _isSearchMode
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  tooltip: "cancel",
                  onPressed: () {
                    setState(() {
                      _isSearchMode = false;
                    });
                  })
              : IconButton(
                  icon: const Icon(Icons.search),
                  tooltip: "search",
                  onPressed: () {
                    setState(() {
                      _isSearchMode = true;
                    });
                  })
        ]);
  }
}
