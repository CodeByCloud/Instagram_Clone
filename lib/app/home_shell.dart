import 'package:flutter/material.dart';
import 'package:instagram_clone/features/feed/screens/feed_screen.dart';
import 'package:instagram_clone/features/search/screens/search_screen.dart';
import 'package:instagram_clone/features/reels/screens/reels_screen.dart';
import 'package:instagram_clone/features/activity/screens/notifications_screen.dart';
import 'package:instagram_clone/features/profile/screens/profile_screen.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  final List<Widget> _screens = const [
    FeedScreen(),
    SearchScreen(),
    ReelsScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        height: 60,
        backgroundColor: Theme.of(context).colorScheme.surface,
        indicatorColor: Colors.transparent, // Instagram doesn't use pill indicators
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, size: 28),
            selectedIcon: Icon(Icons.home, size: 28),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined, size: 28),
            selectedIcon: Icon(Icons.search, size: 28),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.movie_creation_outlined, size: 28), // Closest to Reels
            selectedIcon: Icon(Icons.movie_creation, size: 28),
            label: 'Reels',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border, size: 28),
            selectedIcon: Icon(Icons.favorite, size: 28),
            label: 'Activity',
          ),
          NavigationDestination(
            icon: CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
            ),
            selectedIcon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.black, // Dark border wrapper
              child: CircleAvatar(
                radius: 14,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
