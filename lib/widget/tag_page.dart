import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_book_of_friends/bloc/tag_bloc.dart';
import 'package:your_book_of_friends/model/tag.dart';

class TagPage extends StatefulWidget {
  const TagPage({super.key});

  @override
  State<StatefulWidget> createState() => TagPageState();
}

class TagPageState extends State<TagPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<TagBloc>(context);
    return StreamBuilder(
      stream: bloc.tagStream,
      builder: (BuildContext context, AsyncSnapshot<List<Tag>> snapshot) {
        return snapshot.hasData && snapshot.data!.isNotEmpty
            ? SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                final t = snapshot.data![index];
                return tagCard(context, t);
              }, childCount: snapshot.data!.length))
            : const SliverToBoxAdapter();
      },
    );
  }
}

Widget tagCard(BuildContext context, Tag t) {
  return Card(
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.grey, width: 0.5),
      borderRadius: BorderRadius.circular(5),
    ),
    color: Colors.white,
    child: ListTile(
      leading: Icon(Icons.label, color: Color(t.color)),
      title: Text(t.name),
    ),
  );
}
