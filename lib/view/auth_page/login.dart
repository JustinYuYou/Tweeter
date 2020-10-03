import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tweeter/model/model.dart';
import 'package:tweeter/model/repository/user_repository.dart';
import 'package:tweeter/view/routing.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Use the auth bloc to rebuild the view.
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // If the state reported an error, display an error to the user.
        print('Login listening');
        if (state.friendlyError.isNotEmpty) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(state.friendlyError),
          ));
        }

        // If the current user isn't null, then we signed in successfully.
        // Navigate to the home page.
        if (context.repository<UserRepository>().getCurrentUser() != null) {
          print('Login successful');
          Navigator.of(context).pushReplacementNamed(AppRoutes.mainPage);
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("The user doesn't exist"),
          ));
        }
      },
      builder: _buildView,
    );
  }

  Widget _buildView(BuildContext context, AuthState state) {
    final authBloc = context.bloc<AuthCubit>();
    // If the auth state is loading, display a loading bar.
    if (state.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    final loginButton = RaisedButton(
      onPressed: () => authBloc.loginUser(
        handle: usernameController.text,
        password: passwordController.text,
      ),
      child: Text('Log in'),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username')),
            TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password')),
            loginButton,
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
