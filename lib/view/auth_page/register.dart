import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tweeter/model/cubit/auth_cubit/auth_cubit.dart';
import 'package:tweeter/view/main_page/main_page.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  File _image;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final handleController = TextEditingController();
  final passwordController = TextEditingController();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, state) {},
      builder: (context, state) {
        return Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(decoration: InputDecoration(labelText: 'First Name')),
            TextFormField(decoration: InputDecoration(labelText: 'Last Name')),
            TextFormField(
                autovalidate: true,
                validator: (val) {
                  if (val.isEmpty) {
                    return "Please enter user name";
                  }

                  return null;
                },
                decoration: InputDecoration(labelText: 'User Name')),
            TextFormField(decoration: InputDecoration(labelText: 'Password')),
            RaisedButton(
              child: Text('Take Picture'),
              onPressed: () async {
                await getImage();
              },
            ),
            RaisedButton(
              child: Text("Sign up"),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  context.bloc<AuthCubit>().registerUser(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      handle: handleController.text,
                      password: passwordController.text);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                }
              },
            )
          ],
        ));
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    handleController.dispose();
    passwordController.dispose();
    lastNameController.dispose();
  }
}
