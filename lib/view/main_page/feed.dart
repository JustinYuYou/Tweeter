import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tweeter/model/cubit/cubit.dart';
import 'package:tweeter/model/cubit/feed_cubit/feed_cubit.dart';
import 'package:tweeter/model/repository/user_repository.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool isInitialized = false;
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
  }

  void _onRefresh() async {
    if (!isInitialized) {
      isInitialized = true;
    }
    final feedCubit = context.bloc<FeedCubit>();
    feedCubit.getStatus();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = context.repository<UserRepository>().getCurrentUser();
    return Builder(
      builder: (context) => BlocConsumer<FeedCubit, FeedState>(
        listener: (context, state) {
          print('Listening here');
          print(state.props);
        },
        builder: (context, state) {
          final status = state.status;
          print('Building here');
          print(state.props);

          return SmartRefresher(
            controller: _refreshController,
            onRefresh: _onRefresh,
            enablePullDown: true,
            child: isInitialized
                ? ListView.builder(
                    reverse: true,
                    itemCount: status.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                print('Pressed on user');
                              },
                              leading: CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                  currentUser.photoURL,
                                ),
                              ),
                              title: Text(currentUser.fullName),
                              subtitle: Text(currentUser.handle),
                            ),
                            Text(status[index].content +
                                status[index].statusPostTime.toString())
                          ],
                        ),
                      );
                    })
                : Center(child: Text('Scroll down to load')),
          );
        },
      ),
    );
  }
}
