import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // if failed,use refreshFailed()
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
    return BlocConsumer<FeedCubit, FeedState>(
      listener: (context, state) {},
      builder: (context, state) {
        final status = state.status;

        return SmartRefresher(
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: isInitialized
              ? ListView.builder(
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
                            title: Text(currentUser.fullName()),
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
    );
  }
}
