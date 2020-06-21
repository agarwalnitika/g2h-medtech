import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key key, @required this.name, @required this.phone})
      : super(key: key);

  final String name;
  final String phone;

  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  FirebaseUser currentUser;

  String name;
  String phone;
  void initState() {
    // TODO: implement initState
    //getProfileImage();
    this.getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    currentUser = await FirebaseAuth.instance.currentUser();
  }

  final _formKey = GlobalKey<FormState>();

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      setState(() {
        Firestore.instance
            .collection("users")
            .document(currentUser.uid)
            .updateData({
          'name': name,
          'phone': phone,
        });
      });

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 2.0,
        centerTitle: true,
        backgroundColor: Colors.teal[800],
        title: Text('Edit Profile'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Save',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onPressed: () {
              _submit();
            },
          )
        ],
      ),
      body: SingleChildScrollView(child: _buildContents(context)),
    );
  }

  Widget _buildContents(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _buildFormChildren(),
        ),
      ),
    );
  }

  List<Widget> _buildFormChildren() {
    return [
      TextFormField(
        initialValue: widget.name,
        decoration: InputDecoration(labelText: 'Name'),
        onSaved: (value) => name = value,
        validator: (value) => value.isNotEmpty ? null : 'Name can\'t be empty',
      ),
      TextFormField(
        initialValue: widget.phone,
        decoration: InputDecoration(labelText: 'Phone No.'),
        onSaved: (value) => phone = value,
        validator: (value) =>
            value.isNotEmpty ? null : 'Number can\'t be empty',
      ),
    ];
  }
}
