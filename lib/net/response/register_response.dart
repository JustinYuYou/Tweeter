import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:tweeter/model/domain/domain.dart';

class RegisterResponse extends Equatable {
  final User user;
  final AuthToken token;

  const RegisterResponse({
    @required this.user,
    @required this.token,
  }) : super();

  @override
  List<Object> get props => [user, token];
}
