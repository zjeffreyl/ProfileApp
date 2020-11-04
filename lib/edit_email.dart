import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:profile_page_app/edit_field.dart';
import 'package:profile_page_app/edit_view_page.dart';

class EditEmail extends EditField{

  final String value;
  final String heading;

  EditEmail({@required this.value, @required this.heading});

  @override
  State<StatefulWidget> createState() => _EditEmailState();
}

class _EditEmailState extends EditFieldState<EditEmail> with BasicEditView {

  @override
  Widget input() {
    return Container(
      width: 300,
      child: TextFormField(
        initialValue: widget.value,
        autocorrect: false,
        validator: (newValue)
        {
          bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(newValue);
          print(emailValid);
          if(emailValid)
          {
            isValid = true;
            value = newValue;
            return null;
          }
          else
          {
            isValid = false;
            return "Invalid email";
          }
        },
        autovalidate: true,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.secondaryVariant)
          ),
          labelText: "You email address"
        ),
      ),
    );
  }

}