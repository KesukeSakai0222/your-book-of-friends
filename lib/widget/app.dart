import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_book_of_friends/define/classification.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
              floating: true,
              title: Text(AppLocalizations.of(context)!.title,
                  style: GoogleFonts.hinaMincho(fontWeight: FontWeight.bold)),
              centerTitle: true),
          _contents[_selectedIndex],
        ]),
        bottomNavigationBar: BottomNavigationBar(
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
              icon: const Icon(Icons.search),
              label: AppLocalizations.of(context)!.search,
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onTapItem,
        ));
  }

  final _contents = [
    SliverList(delegate: SliverChildListDelegate([const Text("friend")])),
    SliverList(delegate: SliverChildListDelegate([const Text("event")])),
    SliverList(
        delegate: SliverChildListDelegate([
      for (var i = 0; i < 100; i++)
        ListTile(
          title: Text("item $i"),
        )
    ]))
  ];

  void _onTapItem(int index) {
    setState(() => _selectedIndex = index);
  }
}
