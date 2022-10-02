import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:your_book_of_friends/bloc/friend_bloc.dart';
import 'package:your_book_of_friends/dao/my_database.dart';
import 'package:your_book_of_friends/widget/app.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<StatefulWidget> createState() => MyAppBarState();
}

class MyAppBarState extends State<StatefulWidget> {
  bool _isSearchMode = false;
  @override
  Widget build(BuildContext context) {
    var index = Provider.of<SelectedIndex>(context).index;
    return SliverAppBar(
        title: _isSearchMode
            ? TextField(
                autofocus: true,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.search,
                onChanged: (value) {
                  switch (index) {
                    case 0:
                      FriendBloc(
                              Provider.of<MyDatabase>(context, listen: false))
                          .searchFriends(value);
                      break;
                    case 1:
                      break;
                    case 2:
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
