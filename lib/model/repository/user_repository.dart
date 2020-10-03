import 'package:tweeter/model/model.dart';

/// A repository to hold the user data. The user is shared between
/// multiple blocs. So we put this in a repository.
class UserRepository {
  UserRepository();

  /// The current user.
  User _user;
  List<Follow> follows;

  User getCurrentUser() {
    return _user;
  }

  void setCurrentUser(User value) {
    _user = value;
  }

  List<Follow> getFollows() {
    return follows;
  }
}
