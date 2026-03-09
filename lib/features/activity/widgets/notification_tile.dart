import 'package:flutter/material.dart';

enum NotificationType { like, comment, follow }

class NotificationTile extends StatelessWidget {
  final String username;
  final String userAvatar;
  final String timeAgo;
  final NotificationType type;
  final String? commentText;
  final String? postImage;

  const NotificationTile({
    super.key,
    required this.username,
    required this.userAvatar,
    required this.timeAgo,
    required this.type,
    this.commentText,
    this.postImage,
  });

  @override
  Widget build(BuildContext context) {
    String actionText = '';
    switch (type) {
      case NotificationType.like:
        actionText = 'liked your post.';
        break;
      case NotificationType.comment:
        actionText = 'commented: $commentText';
        break;
      case NotificationType.follow:
        actionText = 'started following you.';
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(userAvatar),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: '$username ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: actionText),
                  TextSpan(
                    text: ' $timeAgo',
                    style: TextStyle(color: Theme.of(context).hintColor),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          if (type == NotificationType.follow)
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                elevation: 0,
                minimumSize: const Size(80, 32),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Follow'),
            )
          else if (postImage != null)
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(postImage!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
