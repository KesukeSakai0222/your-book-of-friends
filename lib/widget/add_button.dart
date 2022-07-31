import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key});

  @override
  State<StatefulWidget> createState() => AddButtonState();
}

class AddButtonState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
    );
  }

  // void _onPressed() {
  //   setState(() => _selectedIndex = index);
  // }
}
