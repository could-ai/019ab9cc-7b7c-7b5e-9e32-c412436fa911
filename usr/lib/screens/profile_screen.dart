import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 20),
        Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'User Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'user@example.com',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        _buildSectionHeader(context, 'Account'),
        _buildListTile(context, Icons.person_outline, 'Edit Profile'),
        _buildListTile(context, Icons.notifications_outlined, 'Notifications'),
        _buildListTile(context, Icons.lock_outline, 'Privacy & Security'),
        const SizedBox(height: 24),
        _buildSectionHeader(context, 'App Settings'),
        _buildListTile(context, Icons.language, 'Language'),
        _buildListTile(context, Icons.dark_mode_outlined, 'Dark Mode'),
        const SizedBox(height: 24),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.red),
          title: const Text(
            'Log Out',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 16),
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, IconData icon, String title) {
    return Card(
      elevation: 0,
      color: Colors.grey[50],
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey[700]),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {
          // Placeholder for navigation
        },
      ),
    );
  }
}
