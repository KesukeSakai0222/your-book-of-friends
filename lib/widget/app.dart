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
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => SelectedIndex(),
        child: Scaffold(
          body: CustomScrollView(slivers: <Widget>[
            SliverAppBar(
                title: Text(AppLocalizations.of(context)!.title,
                    style: GoogleFonts.hinaMincho(fontWeight: FontWeight.bold)),
                floating: true,
                centerTitle: true),
            Consumer<SelectedIndex>(
                builder: (context, selectedIndex, _) =>
                    _contents[selectedIndex.index])
          ]),
          bottomNavigationBar: const BottomBar(),
          floatingActionButton: const AddButton(),
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

class SelectedIndex with ChangeNotifier {
  var _index = 0;

  get index => _index;

  void setIndex(int index) {
    _index = index;
    notifyListeners();
  }
}
