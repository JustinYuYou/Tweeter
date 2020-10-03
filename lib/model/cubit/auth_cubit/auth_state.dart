part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.isLoading,
    // this.currentUser,
    this.friendlyError,
  });

  factory AuthState.initialState() {
    return AuthState(
      isLoading: false,
      // currentUser: null,
      friendlyError: '',
    );
  }

  /// Whether the auth state is loading (e.g. the user is signing in).
  final bool isLoading;

  /// The currently signed in user. Will be null if not signed in.
  // final User currentUser;

  /// A friendly error detailing what went wrong when siging in.
  final String friendlyError;

  @override
  List<Object> get props => [
        isLoading,
        // currentUser,
        friendlyError,
      ];

  /// Copies the current object with some new fields.
  AuthState copyWith({
    bool isLoading,
    // User currentUser,
    String friendlyError,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      // currentUser: currentUser ?? this.currentUser,
      friendlyError: friendlyError ?? this.friendlyError,
    );
  }
}
