import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageEdit extends StatefulWidget {
  final File imageFile;

  ProfileImageEdit({Key key, @required this.imageFile}) : super(key: key);

  @override _ProfileImageEditState createState() => _ProfileImageEditState();
}

class _ProfileImageEditState extends State<ProfileImageEdit> {

  final _picker = ImagePicker();
  File _selectedImageFile;

  @override
  void initState() {
    _selectedImageFile = widget.imageFile;
      super.initState();
  }
  _imgFromCamera() async {
    final pickedFile = await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50
    );
    setState(() {
      if(pickedFile != null)
        {
          _selectedImageFile = File(pickedFile.path);
        }
      else
        {
          print('No image selected');
        }
    });
  }

  _imgFromGallery() async {
    final pickedFile = await _picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50
    );
    setState(() {
      if(pickedFile != null)
      {
        _selectedImageFile = File(pickedFile.path);
      }
      else
      {
        print('No image selected');
      }
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
                child: new Wrap(
                  children: [
                    new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      },
                    ),
                    new ListTile(
                      leading: new Icon(Icons.camera),
                      title: new Text('Camera'),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                )
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Upload a photo of yourself:", style: Theme.of(context).primaryTextTheme.headline1,),
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){_showPicker(context);},
              child: Container(
                width: 300,
                height: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: new DecorationImage(
                      image: _selectedImageFile == null ? AssetImage('assets/images/profile_image.jpeg') : FileImage(_selectedImageFile),
                      fit: BoxFit.cover
                  ),
                ),

              ),
            ),
            SizedBox(height: 30,),
            RaisedButton(
              elevation: 10,
              padding: EdgeInsets.fromLTRB(120, 20, 120, 20),
              color: Theme.of(context).colorScheme.onSurface,
              child: Text("Update",),
              onPressed: () {
                Navigator.pop(context, _selectedImageFile);
              },
            )
          ],
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            title: Text(''),
            // You can add title here
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onSurface),
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.0),
            //You can make this transparent
            elevation: 0.0, //No shadow
          ),
        ),
      ]),
    );
  }
}
