part of 'main_cubit.dart';

class MainState extends Equatable {
  const MainState({
    this.isLoading,
    // this.currentUser,
    this.follows,
    this.friendlyError,
  });

  factory MainState.initialState() {
    return MainState(
      isLoading: false,
      follows: null,
      friendlyError: '',
    );
  }

  final bool isLoading;
  // final User currentUser;
  final List<Follow> follows;
  final String friendlyError;

  /// Copies the current object with some new fields.
  MainState copyWith({
    bool isLoading,
    User currentUser,
    List<Follow> follows,
    String friendlyError,
  }) {
    return MainState(
      isLoading: isLoading ?? this.isLoading,
      // currentUser: currentUser ?? this.currentUser,
      follows: follows ?? this.follows,
      friendlyError: friendlyError ?? this.friendlyError,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        isLoading,
        // currentUser,
        follows,
        friendlyError,
      ];
}
