import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task10_riverrpod/models/post.dart';
import 'package:task10_riverrpod/state/post_state.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            PostState state = ref.watch(postProvider);
            if (state is InitialState) {
              return Text('Press Button to Press data');
            }
            if (state is PostLoading) {
              return CircularProgressIndicator();
            }
            if (state is ErrorState) {
              return Text(state.message);
            }
            if (state is PostLoaded) {
              return _buildListView(state);
            }
            return Text('Nothing foud');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(postProvider.notifier).fetchPosts(),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildListView(PostLoaded state) {
    return ListView.builder(
        itemCount: state.posts.length,
        itemBuilder: (context, index) {
          Post post = state.posts[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(post.id.toString()),
            ),
            title: Text(post.title),
          );
        });
  }
}
