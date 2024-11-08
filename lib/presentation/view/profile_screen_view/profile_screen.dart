import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'profile_section.dart';
import 'profile_tile.dart';
import 'package:fooder/presentation/widgets/reusable_widget/bottom_nav_bar.dart'; // Import StylishBottomNavBar

// Assume we have these providers defined elsewhere
final userProvider = StateProvider((ref) => UserModel(
  name: 'John Doe',
  email: 'john.doe@example.com',
  phone: '+1 234 567 8900',
  avatar: 'assets/images/avatar.png',
));

final themeProvider = StateProvider((ref) => ThemeMode.system);

class UserModel {
  final String name;
  final String email;
  final String phone;
  final String avatar;

  UserModel({required this.name, required this.email, required this.phone, required this.avatar});
}

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Implement edit profile functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(user.avatar),
            ),
            const SizedBox(height: 20),
            Text(
              user.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 5),
            Text(
              user.email,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 30),
            ProfileSection(
              title: 'Account Settings',
              children: [
                ProfileTile(
                  icon: Icons.person,
                  title: 'Personal Information',
                  onTap: () {
                    // TODO: Navigate to personal information screen
                  },
                ),
                ProfileTile(
                  icon: Icons.location_on,
                  title: 'Addresses',
                  onTap: () {
                    // TODO: Navigate to addresses screen
                  },
                ),
                ProfileTile(
                  icon: Icons.payment,
                  title: 'Payment Methods',
                  onTap: () {
                    // TODO: Navigate to payment methods screen
                  },
                ),
              ],
            ),
            ProfileSection(
              title: 'Preferences',
              children: [
                ProfileTile(
                  icon: Icons.notifications,
                  title: 'Notifications',
                  onTap: () {
                    // TODO: Navigate to notifications settings screen
                  },
                ),
                SwitchListTile(
                  secondary: const Icon(Icons.dark_mode),
                  title: const Text('Dark Mode'),
                  value: themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    ref.read(themeProvider.notifier).state = value ? ThemeMode.dark : ThemeMode.light;
                  },
                ),
              ],
            ),
            ProfileSection(
              title: 'Support',
              children: [
                ProfileTile(
                  icon: Icons.help,
                  title: 'Help Center',
                  onTap: () {
                    // TODO: Navigate to help center screen
                  },
                ),
                ProfileTile(
                  icon: Icons.info,
                  title: 'About Us',
                  onTap: () {
                    // TODO: Navigate to about us screen
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement logout functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Log Out'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: StylishBottomNavBar(
        selectedIndex: 4, // Set the selected index to Profile
        onItemSelected: (index) {
          // Handle navigation
        },
      ),
    );
  }
}