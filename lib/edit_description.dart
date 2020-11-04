import 'package:flutter/material.dart';
import 'package:profile_page_app/edit_field.dart';
import 'package:profile_page_app/edit_view_page.dart';

class EditDescription extends EditField {
  final String value;
  final String heading;

  EditDescription({@required this.value, @required this.heading});

  @override
  State<StatefulWidget> createState() => _EditDescriptionState();
}

class _EditDescriptionState extends EditFieldState<EditDescription> with BasicEditView {
  TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: widget.value);
  }

  @override
  Widget input() {
    return Container(
      width: 300,
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        initialValue: widget.value,
        autocorrect: true,
        autovalidate: true,
        decoration: InputDecoration(
          hintText: "Write a little bit about yourself, Do you like chatting? Are you a smoker? Do you bring pets with you? Etc.",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.secondaryVariant)
          ),
        ),
        onChanged: (newValue) {
          value = newValue;
        }
      ),
    );
  }

}