import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Row: Avatar + Stats
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              // Avatar
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outlineVariant,
                    width: 1,
                  ),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://i.pravatar.cc/150?img=11'),
                  ),
                ),
              ),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _StatColumn(count: '42', label: 'Posts'),
                    _StatColumn(count: '1,234', label: 'Followers'),
                    _StatColumn(count: '567', label: 'Following'),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Bio Section
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jane Doe',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Flutter Developer | UI/UX Enthusiast'),
              Text('Building beautiful cross-platform apps.'),
              Text(
                'linktr.ee/janedoe',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        // Action Buttons Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: _buildActionButton(context, 'Edit profile', () {}),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildActionButton(context, 'Share profile', () {}),
              ),
              const SizedBox(width: 8),
              _buildActionButton(context, null, () {}, icon: Icons.person_add_outlined),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, String? label, VoidCallback onTap, {IconData? icon}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
        ),
        child: icon != null 
            ? Icon(icon, size: 20) 
            : Text(
                label ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String count;
  final String label;

  const _StatColumn({
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
