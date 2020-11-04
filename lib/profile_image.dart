import 'dart:io';

import 'package:flutter/material.dart';
import 'package:profile_page_app/profile_image_edit.dart';

class ProfileImage extends StatefulWidget {

  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  final double editButtonSize = 36;
  File _file;

  Widget image()
  {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  image: _file != null ? FileImage(_file) : AssetImage('assets/images/profile_image.jpeg'),
                  fit: BoxFit.cover
              )
          ),
        ),
        Positioned(
          top: 10,
          right: 0,
          child: RawMaterialButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              constraints: BoxConstraints(
                  maxWidth: editButtonSize,
                  minWidth: editButtonSize,
                  maxHeight: editButtonSize,
                  minHeight: editButtonSize),
              onPressed: () async {
                final _imageFile = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileImageEdit(imageFile: _file,))
                );
                setState(() {
                  //_imageFile could remain null
                  _file = _imageFile;
                });
              },
              fillColor: Colors.white,
              elevation: 2,
              child: Icon(
                  Icons.edit,
                  size: 25,
                  color: Theme.of(context).colorScheme.secondary,
              ),
              shape: CircleBorder()
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Edit Profile",
              style: Theme.of(context).primaryTextTheme.headline2,
            ),
            SizedBox(height: 25,),
            image(),
          ],
        )
    );
  }
}
