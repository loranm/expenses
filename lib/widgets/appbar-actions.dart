import 'package:flutter/material.dart';

class AppbarActions extends StatelessWidget {
  final Function openDialog;

  AppbarActions({this.openDialog});
  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(Icons.add), onPressed:openDialog);
  }
}
