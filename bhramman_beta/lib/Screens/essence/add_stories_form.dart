import 'package:flutter/material.dart';

class AddStoriesForm extends StatefulWidget {
  @override
  _AddStoriesFormState createState() => _AddStoriesFormState();
}

class _AddStoriesFormState extends State<AddStoriesForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Stories'),
      ),
    );
  }
}
