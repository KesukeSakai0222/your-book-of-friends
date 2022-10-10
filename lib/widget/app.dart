import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:your_book_of_friends/model/selected_index.dart';
import 'package:your_book_of_friends/widget/bottom_bar.dart';
import 'package:your_book_of_friends/widget/friend_page.dart';
import 'package:your_book_of_friends/widget/tag_page.dart';

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
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        const MyAppBar(),
        Consumer<SelectedIndex>(
            builder: (context, selectedIndex, _) =>
                contents[selectedIndex.index])
      ]),
      bottomNavigationBar: const BottomBar(),
      floatingActionButton: const AddButton(),
    );
  }

  final contents = [
    const FriendPage(),
    SliverList(delegate: SliverChildListDelegate([const Text("event")])),
    const TagPage()
  ];
}
