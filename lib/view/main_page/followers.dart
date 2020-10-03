import 'package:flutter/material.dart';
import 'package:tweeter/model/model.dart';

class Followers extends StatefulWidget {
  @override
  _FollowersState createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  List<User> _following = [];

  @override
  Widget build(BuildContext context) {
    return null;
  }

  Widget _buildView(BuildContext context) {
    return ListView.builder(
      itemCount: _following.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          print('Pressed on user');
        },
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            'https://picsum.photos/250?image=9',
          ),
        ),
        title: Text('John Doe'),
        subtitle: Text('@handle'),
      ),
    );
  }
}
