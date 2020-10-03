import 'package:tweeter/model/domain/domain.dart';

class Status {
  Status({this.mentionedUser, this.content, this.statusPostTime});
  User mentionedUser;
  // List<String> urls;
  String content;
  var statusPostTime;
}
