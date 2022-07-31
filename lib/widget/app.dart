import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:your_book_of_friends/widget/bottom_bar.dart';

import 'add_button.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  final _selectedIndex = SelectedIndex();
  final _bottomBar = const BottomBar();
  final _addButton = const AddButton();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SelectedIndex>.value(
        value: _selectedIndex,
        child: Scaffold(
          body: CustomScrollView(slivers: <Widget>[
            SliverAppBar(
                title: Text(AppLocalizations.of(context)!.title,
                    style: GoogleFonts.hinaMincho(fontWeight: FontWeight.bold)),
                floating: true,
                centerTitle: true),
            _contents[_selectedIndex.index],
          ]),
          bottomNavigationBar: _bottomBar,
          floatingActionButton: _addButton,
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
}

class SelectedIndex extends ChangeNotifier {
  var index = 0;

  void setIndex(int index) {
    this.index = index;
    notifyListeners();
  }
}
