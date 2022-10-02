import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:your_book_of_friends/widget/bottom_bar.dart';
import 'package:your_book_of_friends/widget/friend_page.dart';

import 'add_button.dart';
import 'app_bar.dart';

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
            const MyAppBar(),
            Consumer<SelectedIndex>(
                builder: (context, selectedIndex, _) =>
                    _contents[selectedIndex.index])
          ]),
          bottomNavigationBar: const BottomBar(),
          floatingActionButton: const AddButton(),
        ));
  }

  final _contents = [
    const FriendPage(),
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
