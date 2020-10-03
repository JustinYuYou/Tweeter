part of "feed_cubit.dart";

class FeedState extends Equatable {
  FeedState({this.status});

  factory FeedState.initialState() {
    return FeedState(status: null);
  }

  List<Status> status;

  @override
  List<Object> get props => [status];

  FeedState copyWith({status}) {
    return FeedState(status: status);
  }

  void setStatus(List<Status> status) {
    status = status;
  }
}
