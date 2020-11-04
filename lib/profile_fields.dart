import 'package:flutter/material.dart';
import 'package:profile_page_app/edit_description.dart';
import 'package:profile_page_app/edit_email.dart';
import 'package:profile_page_app/edit_name.dart';
import 'package:profile_page_app/edit_field.dart';
import 'package:profile_page_app/edit_phone.dart';

class ProfileFields extends StatefulWidget {
  @override
  _ProfileFieldsState createState() => _ProfileFieldsState();
}

class _ProfileFieldsState extends State<ProfileFields> {
  String firstName= "Micah";
  String lastName = "Smith";
  String phone = "(801) - 472 - 8755";
  String email = "micahsmith@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Container(
        child: Column(
          children: <CustomListItem>[
            CustomListItem(title: "Name", value: firstName, lastName: lastName,),
            CustomListItem(title: "Phone", value: phone),
            CustomListItem(title: "Email", value: email),
            CustomListItem(title: "Tell us about yourself", value: "Hi my name is Mica Smith. I am from Mesa but go to school in Salt Lake City. I make this drive all the time and have plenty.", multipleLines: true,)
          ],
        ),
      ),
    );
  }
}

class CustomListItem extends StatefulWidget {

  final String title;
  final String value;
  final String lastName;
  final bool multipleLines;

  CustomListItem({
    @required this.title,
    @required this.value,
    this.lastName = '',
    this.multipleLines = false,
  });

  @override
  _CustomListItemState createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem>{

  String value;
  String lastName;

  @override
  void initState() {
    super.initState();
    value = widget.value;
    lastName = widget.lastName;
  }

  getEditor()
  {
    switch(widget.title)
    {
      case "Name":
        return EditName(heading: "What's your name?", value: value, lastName: lastName,);
      case "Phone":
        return EditPhone(heading: "What's your phone number?", value: value,);
      case "Email":
        return EditEmail(heading: "What's your email", value: value,);
      case "Tell us about yourself":
        return EditDescription(heading: "What type of passenger are you?", value: value,);
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Text(
              widget.title,
              style: Theme.of(context).primaryTextTheme.headline3,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 300,
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    lastName != null ? value + " " + lastName : value,
                    style: Theme.of(context).primaryTextTheme.headline4,
                    maxLines: widget.multipleLines? 5 : 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox.fromSize(
                  size: Size(20, 20),
                  child: ClipOval(
                    child: Material(
                      child: InkWell(
                        onTap: () async {
                          final _values = await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => getEditor())
                          );
                          if(_values != null)
                            {
                              setState(() {
                                value = _values["value"];
                                lastName = _values["lastName"];
                              });
                            }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_forward_ios, size: 15, color: Theme.of(context).colorScheme.secondaryVariant,)
                          ],
                        ),
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
          Divider(
              color: Theme.of(context).colorScheme.secondaryVariant,
            ),
        ],
      ),
    );
  }
}
