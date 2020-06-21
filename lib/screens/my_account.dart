import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:g2h_medtech/common_widgets/avatar.dart';
import 'package:g2h_medtech/common_widgets/empty_content.dart';
import 'package:g2h_medtech/model/user.dart';
import 'package:g2h_medtech/services/auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as Path;

import 'edit_account.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  File _image;
  String _uploadedFileURL;

  Future<void> chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  Future<void> _signOut(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context);
    try {
      await auth.signOut();
    } catch (e) {
      print('${e.toString()}');
    }
  }

  Future<void> uploadFile() async {
    final auth = Provider.of<AuthBase>(context);
    await auth.uploadImage(_image.path);
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('users/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 600,
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: StreamBuilder(
                              stream: Firestore.instance
                                  .collection('users')
                                  .document(user.uid)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                var userDocument = snapshot.data;
                                print(userDocument);
                                return ListView(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 100,
                                    ),
                                    checkUser(userDocument, user, context),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 40,
                right: 0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    child: Center(
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () => _signOut(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo(User user) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: _image == null ? chooseFile : uploadFile,
          child: Container(
            child: Avatar(
              photoUrl: _image != null ? _uploadedFileURL : user.photoUrl,
              radius: 50,
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        if (user.name != null)
          Text(
            user.name,
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
      ],
    );
  }

  checkUser(DocumentSnapshot userDocument, User user, BuildContext context) {
    if (userDocument['email'] == null) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          _buildUserInfo(user),
          Container(
            height: 100,
            child: Center(
              child: EmptyContent(
                title: "No Account Found :(",
                message: 'Register yourself to get started',
              ),
            ),
          ),
        ],
      );
    } else if (userDocument['name'] == null) {
      return Column(
        children: <Widget>[
          _buildUserInfo(user),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  userDocument["phone"],
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
              )),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  userDocument["email"],
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans Pro'),
                ),
              ))
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          _buildUserInfo(user),
          Container(
            child: ListTile(
              title: Center(
                  child: Center(
                child: Text(
                  userDocument["name"],
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
            ),
          ),

          Card(
              color: Colors.grey[200],
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  userDocument["phone"],
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
              )),
          Card(
              color: Colors.grey[200],
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  userDocument["email"],
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans Pro'),
                ),
              )),
          Card(
              color: Colors.grey[200],
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.edit,
                  color: Colors.teal,
                ),
                title: Text(
                 ' Edit Profile',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans Pro'),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditAccount(
                      name: userDocument["name"],
                      phone: userDocument["phone"],
                  ),
                  fullscreenDialog: true,
                )),
              )),
        ],
      );
    }
  }
}
