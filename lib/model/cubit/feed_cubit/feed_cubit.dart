import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tweeter/model/domain/status.dart';
import 'package:tweeter/model/repository/user_repository.dart';
import 'package:tweeter/net/request/get_status_request.dart';
import 'package:tweeter/net/server_facade.dart';
import 'package:tweeter/view/main_page/feed.dart';

part "feed_state.dart";

class FeedCubit extends Cubit<FeedState> {
  FeedCubit({@required this.userRepo}) : super(FeedState.initialState());
  final UserRepository userRepo;

  Future<void> getStatus() async {
    final request = StatusRequest();
    final response = await ServerFacade().getStatus(request);
    state.setStatus(response.status);

    emit(state.copyWith(status: response.status));

    // if (response) {
    //   emit(state.copyWith(
    //     currentUser: null,
    //     follows: null,
    //   ));
    // }
  }
}
