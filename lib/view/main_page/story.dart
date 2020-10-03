import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    var statusList = [];
    return ListView.builder(itemBuilder: (context, index) {
      var imageUrl = statusList[index].image;
      final String name = statusList[index].name;
      var timeStamp = statusList[index].timeStamp;
      var content = statusList[index].content;

      return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Image.network(imageUrl),
              title: RichText(text: TextSpan(text: name)),
              subtitle: Text(timeStamp),
            ),
            Container(
              child: Text(content),
            )
          ],
        ),
      );
    });
  }
}
