import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tweeter/model/model.dart';

class Following extends StatefulWidget {
  @override
  _FollowingState createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
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
