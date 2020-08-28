import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory/utils/palette.dart';

import 'package:inventory/utils/size_config.dart';

class ImageField extends StatefulWidget {
  @override
  _ImageFieldState createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  void _openImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: getProportionateScreenHeight(200.0),
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text('Pick an Image'),
                SizedBox(
                  height: getProportionateScreenHeight(10.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        color: Palette.primary,
                        icon: Icon(Icons.camera_alt, size: 50.0),
                        onPressed: () {}),
                    SizedBox(
                      width: getProportionateScreenWidth(30.0),
                    ),
                    IconButton(
                        color: Palette.primary,
                        icon: Icon(Icons.photo_library, size: 50.0,),
                        onPressed: () {

                        })
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).primaryColor;
    return Column(
      children: [
        OutlineButton(
          borderSide: BorderSide(
            width: 2.0,
            color: themeColor,
          ),
          onPressed: () {
            _openImagePicker(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt,
                color: themeColor,
              ),
              SizedBox(width: getProportionateScreenWidth(10.0)),
              Text('Add Image')
            ],
          ),
        )
      ],
    );
  }
}
