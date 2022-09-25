import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:your_book_of_friends/bloc/friend_bloc.dart';
import 'package:your_book_of_friends/dao/my_database.dart';
import 'package:your_book_of_friends/model/friend.dart';
import 'package:your_book_of_friends/model/name.dart';

import '../model/tag.dart';

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
  late FriendBloc _bloc;
  DateTime? _birthday;

  @override
  Widget build(BuildContext context) {
    _bloc = FriendBloc(Provider.of<MyDatabase>(context));
    //TODO: tag追加、name複数追加
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.friendAdd)),
        body: Container(
            padding: const EdgeInsets.all(40),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                      decoration: InputDecoration(
                          icon: const Icon(Icons.face),
                          labelText: AppLocalizations.of(context)!.name),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '必須項目です';
                        }
                        return null;
                      },
                      controller: nameController,
                      autovalidateMode: AutovalidateMode.always),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.cake),
                      labelText: AppLocalizations.of(context)!.birthday,
                      helperText: AppLocalizations.of(context)!.optional,
                      helperStyle: const TextStyle(fontSize: 11, height: 0.5),
                    ),
                    controller: birthdayController,
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      final picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000, 1, 1),
                          firstDate: DateTime(1900, 1, 1),
                          lastDate: DateTime.now());
                      setState(() {
                        _birthday = picked;
                        if (picked != null) {
                          birthdayController.text =
                              DateFormat("yyyy/MM/dd").format(picked);
                        }
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.work),
                      labelText: AppLocalizations.of(context)!.occupation,
                      helperText: AppLocalizations.of(context)!.optional,
                      helperStyle: const TextStyle(fontSize: 11, height: 0.5),
                    ),
                    controller: occupationController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.home),
                      labelText: AppLocalizations.of(context)!.address,
                      helperText: AppLocalizations.of(context)!.optional,
                      helperStyle: const TextStyle(fontSize: 11, height: 0.5),
                    ),
                    controller: addressController,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Icon(Icons.notifications, color: Colors.grey),
                        ),
                        Expanded(
                          child: Text(AppLocalizations.of(context)!.notify,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 18)),
                        ),
                        Switch(
                          value: _isNotify,
                          onChanged: (value) =>
                              setState(() => _isNotify = value),
                        )
                      ])),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.notes),
                        labelText: AppLocalizations.of(context)!.memo),
                    controller: memoController,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                          child: ElevatedButton(
                              onPressed: () {
                                final names = <Name>[
                                  Name.init(nameController.text, true)
                                ];
                                final f = Friend.init(
                                    mainName: nameController.text,
                                    names: names,
                                    tags: List<Tag>.empty(),
                                    memo: memoController.text,
                                    birthday: _birthday,
                                    isNotify: _isNotify,
                                    address: addressController.text,
                                    occupation: occupationController.text);
                                _bloc.addFriend(f);
                                Navigator.of(context).pop();
                              },
                              child: Text(AppLocalizations.of(context)!.save))))
                ],
              ),
            )));
  }
}