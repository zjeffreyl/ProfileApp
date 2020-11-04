import 'package:flutter/material.dart';
import 'package:profile_page_app/edit_field.dart';
import 'package:profile_page_app/edit_view_page.dart';

class EditName extends EditField {

  final String value;
  final String lastName;
  final String heading;

  EditName({@required this.value, @required this.lastName, @required this.heading});

  @override
  _EditNameState createState() => _EditNameState();
}

class _EditNameState extends EditFieldState<EditName> with BasicEditView {
  
  String lastName;
  
  @override
  void initState() {
    super.initState();
    value = widget.value;
    lastName = widget.lastName;
  }

  @override
  Widget input() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.secondaryVariant)
                ),
                labelText: "First Name",
              ),
              initialValue: value,
              onChanged: (newValue)
              {
                value = newValue;
              },
              validator: (newValue) {
                if (newValue.length == 0) {
                  isValid = false;
                  return "Invalid name";
                }
                else {
                  isValid = true;
                  value = newValue;
                  return null;
                }
              },
              autovalidate: true,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.secondaryVariant)
                ),
                labelText: "Last Name",
              ),
              initialValue: lastName,
              onChanged: (newValue)
              {
                lastName = newValue;
              },
              validator: (newValue) {
                if (newValue.length == 0) {
                  lastNameIsValid = false;
                  return "Invalid name";
                }
                else {
                  lastNameIsValid = true;
                  lastName = newValue;
                  return null;
                }
              },
              autovalidate: true,
            ),
          )
        ],
      ),
    );
  }
}
