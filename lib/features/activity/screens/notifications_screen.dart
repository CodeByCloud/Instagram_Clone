import 'package:flutter/material.dart';
import '../widgets/notification_tile.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Today',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const NotificationTile(
            username: 'alex_dev',
            userAvatar: 'https://i.pravatar.cc/150?img=12',
            timeAgo: '2h',
            type: NotificationType.like,
            postImage: 'https://picsum.photos/id/237/200/200',
          ),
          const NotificationTile(
            username: 'sarah_codes',
            userAvatar: 'https://i.pravatar.cc/150?img=5',
            timeAgo: '5h',
            type: NotificationType.follow,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              'This Week',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const NotificationTile(
            username: 'flutter_fan',
            userAvatar: 'https://i.pravatar.cc/150?img=8',
            timeAgo: '2d',
            type: NotificationType.comment,
            commentText: 'This looks amazing! 🔥',
            postImage: 'https://picsum.photos/id/28/200/200',
          ),
          const NotificationTile(
            username: 'design_daily',
            userAvatar: 'https://i.pravatar.cc/150?img=43',
            timeAgo: '3d',
            type: NotificationType.like,
            postImage: 'https://picsum.photos/id/49/200/200',
          ),
          const NotificationTile(
            username: 'ui_ux_god',
            userAvatar: 'https://i.pravatar.cc/150?img=32',
            timeAgo: '5d',
            type: NotificationType.follow,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              'Earlier',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          ...List.generate(
            10,
            (index) => NotificationTile(
              username: 'user_${index + 10}',
              userAvatar: 'https://i.pravatar.cc/150?img=${index + 50}',
              timeAgo: '${index + 1}w',
              type: index % 2 == 0 
                  ? NotificationType.like 
                  : NotificationType.follow,
              postImage: index % 2 == 0 
                  ? 'https://picsum.photos/id/${index + 100}/200/200'
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
