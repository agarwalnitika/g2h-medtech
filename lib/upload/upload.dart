import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File gImage;
  Future getImage_gallery() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      gImage = tempImage;
    });
  }

  Future getImage_camera() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      gImage = tempImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: gImage == null ? Text('Select an Image') : enableUpload(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal[800],
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.camera),
                        title: Text('Camera'),
                        onTap: () {
                          getImage_camera();
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.note_add),
                        title: Text('Documents'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.image),
                        title: Text('Gallery'),
                        onTap: () {
                          getImage_gallery();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }

  Widget enableUpload() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          Center(child: Image.file(gImage, height: 300, width: 300)),
          Center(
            child: RaisedButton(
              child: Text('Upload'),
              elevation: 7.0,
              textColor: Colors.white,
              color: Colors.cyan[900],
              onPressed: () {
                StorageReference firebaseStorageRef =
                    FirebaseStorage.instance.ref().child('test.jpg');
                StorageUploadTask task = firebaseStorageRef.putFile(gImage);
                RaisedButton(
                  onPressed: () {},
                  color: Colors.cyan,
                  child: Text(
                    'Uploaded Successfully',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
