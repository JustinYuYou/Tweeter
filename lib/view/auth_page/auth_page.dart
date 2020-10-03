import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';
import 'register.dart';

class AuthPage extends StatelessWidget {
  static final _tabCount = 2;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: DefaultTabController(
        length: _tabCount,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Sign in",
                ),
                Tab(text: "Sign up"),
              ],
            ),
            title: Text('Twitter'),
          ),
          body: TabBarView(
            children: [Login(), Register()],
          ),
        ),
      ),
    );
  }
}
