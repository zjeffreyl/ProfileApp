import 'package:flutter/material.dart';
import 'package:profile_page_app/edit_field.dart';

mixin BasicEditView<Page extends EditField> on EditFieldState<Page> {

  Widget input();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 80,),
                      Container(
                        alignment: Alignment.center,
                        child: Text(widget.heading, style: Theme.of(context).primaryTextTheme.headline1,),
                      ),
                      SizedBox(height: 40,),
                      input(),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                        elevation: 10,
                        padding: EdgeInsets.fromLTRB(120, 20, 120, 20),
                        color: Theme.of(context).colorScheme.onSurface,
                        child: Text("Update",),
                        onPressed: () {
                          if(isValid && lastNameIsValid)
                          {
                            Navigator.pop(context, {"value": value, "lastName": lastName});
                          }
                          //need to return first and a last name so it remembers on the re edit
                        },
                      ),
                      SizedBox(height: 100,)
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                title: Text(''),
                // You can add title here
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onSurface),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.0),
                //You can make this transparent
                elevation: 0.0, //No shadow
              ),
            ),
          ],
        ),
      )
    );
  }
}