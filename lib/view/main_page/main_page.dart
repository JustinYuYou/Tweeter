import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tweeter/model/cubit/cubit.dart';
import 'package:tweeter/model/domain/status.dart';
import 'package:tweeter/model/repository/user_repository.dart';
import 'package:tweeter/view/main_page/story.dart';
import 'package:tweeter/view/routing.dart';

import 'feed.dart';
import 'followers.dart';
import 'following.dart';

class MainPage extends StatefulWidget {
  static final _tabCount = 4;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final postEditorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.bloc<MainCubit>();
    // final currentUser = mainBloc.state.currentUser;
    final currentUser = context.repository<UserRepository>().getCurrentUser();
    final postWindow = AlertDialog(
      title: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            currentUser.photoURL,
          ),
        ),
        subtitle: Text(currentUser.handle),
      ),
      content: TextField(
        controller: postEditorController,
        decoration: InputDecoration.collapsed(hintText: "What is on your mind"),
        maxLines: null,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Send'),
          onPressed: () {
            final text = postEditorController.text;
            final status =
                Status(content: text, statusPostTime: DateTime.now());
            if (text.length != 0) {
              mainBloc.postStatus(status);
              postEditorController.clear();
            }
          },
        )
      ],
    );

    final header = _buildHeader(context);
    final fab = Builder(
      builder: (context) => FloatingActionButton(
        child: Icon(Icons.drafts),
        onPressed: () {
          showDialog(context: context, builder: (_) => postWindow);
        },
      ),
    );

    // and place them here.
    final tabView = TabBarView(
      children: [
        Feed(),
        Story(),
        Following(),
        Followers(),
      ],
    );

    return BlocConsumer<MainCubit, MainState>(listener: (context, state) {
      // If the state reported an error, display an error to the user.
      if (state.friendlyError.isNotEmpty) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(state.friendlyError),
        ));
      }

      // If the current user isn't null, then we signed in successfully.
      // Navigate to the home page.
      if (currentUser != null) {
        print('Login successful');
        Navigator.of(context).pushReplacementNamed(AppRoutes.mainPage);
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("The user doesn't exist"),
        ));
      }
    }, builder: (context, state) {
      return DefaultTabController(
          length: MainPage._tabCount,
          child: Scaffold(
            appBar: header,
            body: tabView,
            floatingActionButton: fab,
          ));
    });
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final nav = Navigator.of(context);
    final mainBloc = context.bloc<MainCubit>();
    final currentUser = context.repository<UserRepository>().getCurrentUser();

    final tabs = TabBar(
      tabs: [
        Tab(child: Text('Feed')),
        Tab(child: Text('Story')),
        Tab(child: Text('Following')),
        Tab(child: Text('Followers')),
      ],
    );

    final actions = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Spacer(),
          IconButton(
            color: theme.primaryIconTheme.color,
            onPressed: () {
              mainBloc.logOut();
              nav.pushReplacementNamed(AppRoutes.authPage);
              context.repository<UserRepository>().setCurrentUser(null);
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );

    final userInformation = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  currentUser.photoURL,
                ),
              ),
              Text(
                currentUser.firstName + " " + currentUser.lastName,
                style: theme.primaryTextTheme.headline6,
              ),
              Text(currentUser.handle),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Text(
                '15',
                // mainBloc.state.follows.length.toString(),
                style: theme.primaryTextTheme.headline5,
              ),
              Text('Following'),
            ],
          ),
          SizedBox(width: 16),
          Column(
            children: [
              Text(
                '10',
                style: theme.primaryTextTheme.headline5,
              ),
              Text('Followers'),
            ],
          ),
        ],
      ),
    );

    final headerContent = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        actions,
        userInformation,
        Spacer(),
        tabs,
      ],
    );

    return PreferredSize(
      preferredSize: Size.fromHeight(200),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Material(
          color: theme.primaryColor,
          child: SafeArea(
            child: DefaultTextStyle(
              style: theme.primaryTextTheme.bodyText1,
              child: headerContent,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    postEditorController.dispose();
  }
}
