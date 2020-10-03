import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class User extends Equatable {
  final String firstName;
  final String lastName;
  final String handle;
  final String photoURL;

  const User({
    this.firstName,
    this.lastName,
    this.handle,
    this.photoURL,
  }) : super();

  String get fullName => firstName + " " + lastName;

  @override
  List<Object> get props => [
        firstName,
        lastName,
        handle,
        photoURL,
      ];

  @override
  String toString() {
    return '$firstName, $lastName, $handle';
  }
}
