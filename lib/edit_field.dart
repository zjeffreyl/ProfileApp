
import 'package:flutter/material.dart';

abstract class EditField extends StatefulWidget {
  final String value;
  final String lastName;
  final String heading;

  EditField({@required this.heading, @required this.value, this.lastName =''});
}

abstract class EditFieldState<Page extends EditField> extends State<Page>
{
  bool isValid = true;
  bool lastNameIsValid = true;
  String value;
  String lastName;
}