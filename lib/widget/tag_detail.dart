import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:your_book_of_friends/bloc/tag_bloc.dart';
import 'package:your_book_of_friends/model/tag.dart';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class TagAdd extends StatefulWidget {
  const TagAdd({super.key});

  @override
  State<StatefulWidget> createState() => _TagAddState();
}

class _TagAddState extends State<TagAdd> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  static final _white = const Color.fromARGB(255, 255, 255, 255)
      .value
      .toRadixString(16)
      .toString();
  final colorController = TextEditingController(text: _white);

  @override
  Widget build(BuildContext context) {
    final tagBloc = Provider.of<TagBloc>(context);
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.tagAdd)),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.label),
                      labelText: AppLocalizations.of(context)!.tag,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) => _validateRequired(value, context),
                    controller: nameController,
                    autovalidateMode: AutovalidateMode.always,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.color_lens),
                      labelText: AppLocalizations.of(context)!.color,
                      border: const OutlineInputBorder(),
                    ),
                    readOnly: true,
                    controller: colorController,
                    onTap: () => _colorPicker(),
                    validator: (value) => _validateRequired(value, context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () => _save(tagBloc),
                      child: Text(AppLocalizations.of(context)!.save),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }

  void _colorPicker() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.color),
        content: SingleChildScrollView(
            child: MaterialPicker(
          pickerColor: Color(int.tryParse(colorController.text, radix: 16)!),
          onColorChanged: (color) =>
              colorController.text = color.value.toRadixString(16).toString(),
        )),
        actions: <Widget>[
          OutlinedButton(
            onPressed: Navigator.of(context).pop,
            child: Text(AppLocalizations.of(context)!.save),
          )
        ],
      ),
    );
  }

  String? _validateRequired(String? val, BuildContext context) {
    return val == null || val.isEmpty
        ? AppLocalizations.of(context)!.warnRequired
        : null;
  }

  void _save(TagBloc bloc) {
    final color = int.tryParse(colorController.text, radix: 16)!;
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final t = Tag.init(nameController.text, color);
      bloc.addTag(t);
      nameController.text = '';
      colorController.text = _white;
      Navigator.of(context).pop();
    }
  }
}
