import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:your_book_of_friends/bloc/friend_bloc.dart';
import 'package:your_book_of_friends/dao/my_database.dart';
import 'package:your_book_of_friends/dao/tags_dao.dart';
import 'package:your_book_of_friends/model/friend.dart';
import 'package:your_book_of_friends/model/name.dart';
import 'package:your_book_of_friends/model/tag.dart';

class FriendDetail extends StatefulWidget {
  const FriendDetail({super.key});

  @override
  State<StatefulWidget> createState() => FriendDetailState();
}

class FriendDetailState extends State<FriendDetail> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class FriendAdd extends StatefulWidget {
  const FriendAdd({super.key});

  @override
  State<StatefulWidget> createState() => FriendAddState();
}

class FriendAddState extends State<FriendAdd> {
  var _isNotify = false;
  final nameController = TextEditingController();
  final occupationController = TextEditingController();
  final addressController = TextEditingController();
  final memoController = TextEditingController();
  final birthdayController = TextEditingController();
  List<Tag> selectedTags = [];
  late FriendBloc _bloc;
  DateTime? _birthday;

  @override
  void dispose() {
    nameController.dispose();
    occupationController.dispose();
    addressController.dispose();
    memoController.dispose();
    birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = context.watch<FriendBloc>();
    final _tagDao = TagsDao(context.watch<MyDatabase>());

    //TODO: name複数追加
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.friendAdd)),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                        decoration: InputDecoration(
                            icon: const Icon(Icons.face),
                            labelText: AppLocalizations.of(context)!.name,
                            border: const OutlineInputBorder()),
                        validator: (value) => _validateRequired(value, context),
                        controller: nameController,
                        autovalidateMode: AutovalidateMode.always),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Icon(Icons.label, color: Colors.black45),
                        ),
                        Expanded(
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(children: [
                                        Text(AppLocalizations.of(context)!.tag,
                                            style: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 18)),
                                        Expanded(
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: ElevatedButton(
                                                  child: Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .select),
                                                  onPressed: () async =>
                                                      openTagDialog(
                                                          await _tagDao
                                                              .readAll()))),
                                        )
                                      ]),
                                      Wrap(
                                          spacing: 2.0,
                                          children: selectedTags
                                              .map((t) => Chip(
                                                    label: Text(t.name,
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white70,
                                                            fontSize: 15)),
                                                    backgroundColor:
                                                        Color(t.color),
                                                  ))
                                              .toList()),
                                    ])))
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                          decoration: InputDecoration(
                              icon: const Icon(Icons.cake),
                              labelText: AppLocalizations.of(context)!.birthday,
                              border: const OutlineInputBorder()),
                          controller: birthdayController,
                          onTap: () async => openDateDialog())),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                            icon: const Icon(Icons.work),
                            labelText: AppLocalizations.of(context)!.occupation,
                            border: const OutlineInputBorder()),
                        controller: occupationController,
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                            icon: const Icon(Icons.home),
                            labelText: AppLocalizations.of(context)!.address,
                            border: const OutlineInputBorder()),
                        controller: addressController,
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child:
                              Icon(Icons.notifications, color: Colors.black45),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(AppLocalizations.of(context)!.notify,
                              style: const TextStyle(
                                  color: Colors.black54, fontSize: 18)),
                        )),
                        Switch(
                          value: _isNotify,
                          onChanged: (value) =>
                              setState(() => _isNotify = value),
                        )
                      ])),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.notes),
                        labelText: AppLocalizations.of(context)!.memo,
                        border: const OutlineInputBorder()),
                    controller: memoController,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                          child: ElevatedButton(
                              onPressed: () => save(),
                              child: Text(AppLocalizations.of(context)!.save))))
                ],
              ),
            )));
  }

  String? _validateRequired(String? val, BuildContext context) {
    return val == null || val.isEmpty
        ? AppLocalizations.of(context)!.warnRequired
        : null;
  }

  void openTagDialog(List<Tag> allTags) async {
    await FilterListDialog.display<Tag>(
      context,
      listData: allTags,
      selectedListData: selectedTags,
      choiceChipLabel: (tag) => tag!.name,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (tag, query) {
        return tag.name.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedTags = List.from(list!);
        });
        Navigator.pop(context);
      },
    );
  }

  Future openDateDialog() async {
    FocusScope.of(context).requestFocus(FocusNode());
    final picked = await showDatePicker(
        context: context,
        initialDate: DateTime(2000, 1, 1),
        firstDate: DateTime(1900, 1, 1),
        lastDate: DateTime.now());
    setState(() {
      _birthday = picked;
      if (picked != null) {
        birthdayController.text = DateFormat("yyyy/MM/dd").format(picked);
      }
    });
  }

  void save() {
    final names = <Name>[Name.init(nameController.text, true)];
    final f = Friend.init(
        mainName: nameController.text,
        names: names,
        tags: selectedTags,
        memo: memoController.text,
        birthday: _birthday,
        isNotify: _isNotify,
        address: addressController.text,
        occupation: occupationController.text);
    _bloc.addFriend(f);
    Navigator.of(context).pop();
  }
}
