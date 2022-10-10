import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:your_book_of_friends/bloc/friend_bloc.dart';
import 'package:your_book_of_friends/bloc/tag_bloc.dart';
import 'package:your_book_of_friends/dao/my_database.dart';
import 'package:your_book_of_friends/model/selected_index.dart';
import 'package:your_book_of_friends/widget/app.dart';

class Providers extends StatefulWidget {
  const Providers({super.key});

  @override
  State<StatefulWidget> createState() => ProvidersState();
}

class ProvidersState extends State<Providers> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<MyDatabase>(context);
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (BuildContext context) => SelectedIndex()),
      Provider<FriendBloc>(
        create: (context) => FriendBloc(db),
        dispose: (context, value) => value.dispose(),
      ),
      Provider<TagBloc>(
          create: (context) => TagBloc(db),
          dispose: (context, value) => value.dispose())
    ], child: const App());
  }
}
