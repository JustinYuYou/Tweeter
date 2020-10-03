import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tweeter/model/cubit/cubit.dart';
import 'package:tweeter/model/domain/domain.dart';
import 'package:tweeter/model/domain/status.dart';
import 'package:tweeter/model/domain/user.dart';
import 'package:tweeter/model/repository/user_repository.dart';
import 'package:tweeter/net/net.dart';
import 'package:tweeter/net/request/logout_request.dart';
import 'package:tweeter/net/request/post_status_request.dart';
import 'package:tweeter/net/response/post_status_response.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({@required this.userRepo}) : super(MainState.initialState());
  final UserRepository userRepo;

  Future<void> logOut() async {
    final request = LogoutRequest();
    final response = await ServerFacade().logout(request);

    if (response.isSuccessful) {
      emit(state.copyWith(
        currentUser: null,
        follows: null,
      ));
    }
  }

  Future<void> postStatus(Status status) {
    final request = PostStatusRequest(status: status);
    final response = ServerFacade().postStatus(request);
  }
}
