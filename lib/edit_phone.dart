import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile_page_app/edit_field.dart';
import 'package:profile_page_app/edit_view_page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditPhone extends EditField{
  final String value;
  final String heading;

  EditPhone({@required this.value, @required this.heading});

  @override
  _EditPhoneState createState() => _EditPhoneState();
}

class _EditPhoneState extends EditFieldState<EditPhone> with BasicEditView {

  @override
  Widget input() {
    return Container(
      width: 300,
      child: TextFormField(
        initialValue: widget.value,
        inputFormatters: [MaskTextInputFormatter(mask: "(###) - ### - ####")],
        autocorrect: false,
        validator: (newValue) {
          if(newValue.length < 18)
          {
            isValid = false;
            return "Invalid number";
          }
          else
          {
            isValid = true;
            value = newValue;
            return null;
          }
        },
        keyboardType: TextInputType.phone,
        autovalidate: true,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.secondaryVariant)
          ),
          labelText: "Your phone number",
        ),
      ),
    );
  }
}
