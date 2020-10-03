import 'package:tweeter/model/domain/status.dart';
import 'package:tweeter/net/net.dart';
import 'package:tweeter/model/model.dart';
import 'package:tweeter/net/request/get_status_request.dart';
import 'package:tweeter/net/request/logout_request.dart';
import 'package:tweeter/net/request/post_status_request.dart';
import 'package:tweeter/net/request/register_request.dart';
import 'package:tweeter/net/response/get_status_response.dart';
import 'package:tweeter/net/response/logout_response.dart';
import 'package:tweeter/net/response/post_status_response.dart';
import 'package:tweeter/net/response/register_response.dart';
import 'package:tweeter/net/user_generator.dart';

class ServerFacade {
  static final ServerFacade _instance = ServerFacade._();
  List<User> _users;
  List<Follow> _follows;
  List<Status> _status = [
    Status(content: 'hihihi'),
    Status(content: 'testsetset')
  ];

  factory ServerFacade() {
    return _instance;
  }

  ServerFacade._();

  void initializeDummyData() {
    _users = UserGenerator.getInstance().generateUsers(11);
    _users.add(User(
        firstName: 'Justin',
        lastName: 'Yu',
        handle: 'justin',
        photoURL:
            'https://lh3.googleusercontent.com/6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1=w144-h144-n-rw'));

    _follows = [
      Follow(follower: _users.last, followee: _users[1]),
      Follow(follower: _users.last, followee: _users[2]),
      Follow(follower: _users.last, followee: _users[3]),
      Follow(follower: _users.last, followee: _users[4]),
      Follow(follower: _users.last, followee: _users[5]),
    ];
  }

  Future<LoginResponse> login(LoginRequest request) async {
    var user;
    if (_users.where((element) => element.handle == request.handle).length >
        0) {
      user = _users.where((element) => element.handle == request.handle).first;
    }

    final loginResponse = user != null
        ? LoginResponse(
            user: User(
              firstName: user.firstName,
              lastName: user.lastName,
              handle: user.handle,
              photoURL: user.photoURL,
            ),
            token: AuthToken(),
          )
        : LoginResponse(user: null, token: null);

    return loginResponse;
  }

  Future<FollowingResponse> getFollowing(FollowingRequest request) async {
    await Future.delayed(Duration(seconds: 1));
    return FollowingResponse(
      followees: [],
    );
  }

  Future<RegisterResponse> register(RegisterRequest request) async {
    await Future.delayed(Duration(seconds: 1));
    final user = User(
      firstName: request.firstName,
      lastName: request.lastName,
      handle: request.handle,
      photoURL: request?.photoURL,
    );
    _users.add(user);
    return RegisterResponse(
      user: user,
      token: AuthToken(),
    );
  }

  Future<LogoutResponse> logout(LogoutRequest request) async {
    await Future.delayed(Duration(seconds: 1));
    return LogoutResponse(isSuccessful: true);
  }

  Future<PostStatusResponse> postStatus(PostStatusRequest request) async {
    await Future.delayed(Duration(seconds: 1));
    _status.add(request.status);
    print(_status);
    return PostStatusResponse();
  }

  Future<StatusResponse> getStatus(StatusRequest request) async {
    await Future.delayed(Duration(seconds: 1));
    return StatusResponse(status: _status);
  }
}
