import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RegisterRequest extends Equatable {
  final String firstName;
  final String lastName;
  final String handle;
  final String password;
  final String photoURL;

  RegisterRequest({
    @required this.firstName,
    @required this.lastName,
    @required this.photoURL,
    @required this.handle,
    @required this.password,
  }) : super();

  @override
  List<Object> get props => [firstName, lastName, handle, password, photoURL];
}
