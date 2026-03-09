import 'package:flutter/material.dart';
import '../widgets/story_circle.dart';
import '../widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'Billabong', // Custom font if added, falls back to default
            fontSize: 32,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline), // Messenger icon
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 106,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return StoryCircle(
                    isUser: index == 0,
                    username: index == 0 ? 'Your story' : 'user_$index',
                    imageUrl: 'https://i.pravatar.cc/150?img=${index + 10}',
                  );
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PostCard(
                  username: 'creator_$index',
                  userAvatar: 'https://i.pravatar.cc/150?img=${index + 20}',
                  postImage: 'https://picsum.photos/seed/$index/500/500',
                  caption: 'Enjoying the beautiful day! #nature #vibes',
                  likes: 104 + (index * 42),
                  timeAgo: '${index + 1} hours ago',
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
